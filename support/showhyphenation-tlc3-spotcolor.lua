-- Copyright (c) 2022 Thomas Kelkel kelkel@emaileon.de

-- This file may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either
-- version 1.3c of this license or (at your option) any later
-- version. The latest version of this license is in

--    http://www.latex-project.org/lppl.txt

-- and version 1.3c or later is part of all distributions of
-- LaTeX version 2009/09/24 or later.

-- Version: 0.1a  [with modification by UFi for spotcolor use] 

local FLOOR = math.floor

local function round ( num, dec )
    return FLOOR ( num * 10^dec + 0.5 ) / 10^dec
end

local ID = node.id
local GLYPH = ID ( "glyph" )
local DISC = ID ( "disc" )
local KERN = ID ( "kern" )
local GLUE = ID ( "glue" )
local WI = ID ( "whatsit" )
local HLIST = ID ( "hlist" )
local VLIST = ID ( "vlist" )
local RIGHTSKIP = table.swapped ( node.subtypes ("glue") )["rightskip"]
local NEW = node.new
local COPY = node.copy
local REM = node.remove
local PREV = node.prev
local NEXT = node.next
local HAS_GLYPH = node.has_glyph
local INS_B = node.insert_before
local INS_A = node.insert_after
local T = node.traverse
local T_ID = node.traverse_id
local T_GLYPH = node.traverse_glyph
local WIS = node.whatsits()
local pdfliteral
local pairs = pairs
local GET_FONT = font.getfont
local ATC = luatexbase.add_to_callback

local make = false
local on_top = false
local DIR = PREV
local AB = INS_B
local f = 1
local color = "/color1 cs 1 scn"

function make_not_on_top ()
    on_top = false
    DIR = PREV
    AB = INS_B
    f = 1
end

function make_on_top ()
    on_top = true
    DIR = NEXT
    AB = INS_A
    f = - 1
end

local in_use = make_not_on_top

for key, value in pairs ( WIS ) do
    if value == "pdf_literal" then
        pdfliteral = key
    end
end

function showhyphenation_make ()
    make = true
end

function showhyphenation_on_top ()
    in_use = make_on_top
    in_use()
end

function showhyphenation_lime ()
    color = ".75 1 .25"
end

local function calc_value ( value )
    value = round ( value / 65536, 3 )
    return value
end

local function get_x_value ( n, x_value, minus )
    local exp_fac = 1
    local f = 1
    if minus then
        f = - 1
    end
    if n.expansion_factor then
        exp_fac = n.expansion_factor / 1000000 + 1
    end
    if n.id == GLYPH then
        x_value = x_value + calc_value ( n.width ) * exp_fac * f
    elseif n.id == KERN then
        x_value = x_value + calc_value ( n.kern ) * exp_fac * f
    end
    return x_value
end

local line_end_count = 0

local function find_glyph ( n, d, kern_value )
    local line_end = nil
    local ligtype_mark = nil
    if d ( n ) then
        n = d ( n )
        while not ( ( n.id == GLYPH and n.char ~= 45 ) or ( n.id == DISC and n.replace and HAS_GLYPH ( n.replace ) ) ) do
            if n.width and not ( n.char and n.char == 45 ) then
                kern_value = get_x_value ( n, kern_value ) -- rules, etc.
            elseif n.kern then
                kern_value = get_x_value ( n, kern_value ) * 0.5 -- hyphen kern
            end
            if n.char == 45 then
                line_end = true
                line_end_count = line_end_count + 1
            end
            if line_end and n.user_id == 848485 then
                ligtype_mark = true
            end
            if d ( n ) then
                n = d ( n )
            else
                return false
            end
        end
        if n.replace then
            local REPLACE = n.replace
            for some_node in T ( REPLACE ) do
                if some_node.width then
                    kern_value = get_x_value ( some_node, kern_value )
                elseif some_node.kern then
                    kern_value = get_x_value ( some_node, kern_value )
                end
            end
        else
            if n.width then
                kern_value = get_x_value ( n, kern_value )
            end
        end
    end
    return n, kern_value, ligtype_mark
end

local function check_linebreak ( n, d )
    while n.id ~= GLYPH do
        if d ( n ) then
            n = d ( n )
        else break end
    end
    if ( n.char == 45 and d == PREV ) or ( n.id == GLUE and n.subtype == RIGHTSKIP and d == NEXT ) then
        make_not_on_top()
        return true
    end
end

local function hyphenation_points ( head )
    for n in T ( head ) do
        if n.id == HLIST or n.id == VLIST then
            n.head = hyphenation_points ( n.head )
        elseif n.id == DISC then
            check_linebreak ( n, PREV )
            check_linebreak ( n, NEXT )
            local lig_add = 0
            local prev_next_kern = 0
            local prev_next_kern_lig = 0
            if n.replace then
                if not HAS_GLYPH ( n.replace ) then
                    local REPLACE = n.replace
                    for some_node in T ( REPLACE ) do
                        if some_node.kern and not ( check_linebreak ( n, DIR ) ) then
                            prev_next_kern_lig = get_x_value ( some_node, prev_next_kern_lig ) * 0.5
                        end
                    end
                else
                    if n.post then
                        for glyph_node in T_GLYPH ( n.pre ) do
                            if glyph_node.width then
                                lig_add = get_x_value ( glyph_node, lig_add )
                                break -- hyphen!
                            end
                        end
                        if not on_top then
                            if n.replace.kern then
                                prev_next_kern_lig = get_x_value ( n.replace, prev_next_kern_lig )
                            end
                        end
                    else
                        if n.replace.kern then
                            prev_next_kern_lig = get_x_value ( n.replace, prev_next_kern_lig ) * 0.5
                        end
                        for glyph_node in T_GLYPH ( n.replace ) do -- short-armed f
                            if glyph_node.char ~= 45 then
                                lig_add = get_x_value ( glyph_node, lig_add )
                            end
                        end
                    end
                    if on_top then
                        for some_node in T ( n.replace ) do
                            if some_node.width then
                                lig_add = get_x_value ( some_node, lig_add, true )
                            elseif some_node.kern and some_node ~= n.replace then
                                lig_add = get_x_value ( some_node, lig_add, true )
                            end
                        end
                    end
                end
            end
            local prev_next_glyph = n
            local ligtype_mark = nil
            if find_glyph ( prev_next_glyph, DIR, 0 ) then
                prev_next_glyph, prev_next_kern, ligtype_mark = find_glyph ( prev_next_glyph, DIR, 0 )
            end
            head = AB ( head, prev_next_glyph, NEW ( WI, pdfliteral ) )
            lig_add = lig_add + ( prev_next_kern + prev_next_kern_lig ) * f
            DIR ( prev_next_glyph ).mode = 0
            local size_factor = 1
            if font.current() then
                size_factor = calc_value ( GET_FONT ( font.current() ).size / 10 )
            end
            local DATA
            if ( PREV ( n ) and PREV ( n ).user_id and PREV ( n ).user_id == 848485 ) or ligtype_mark then
                DATA = "q " .. ( lig_add - 2 * size_factor ) ..  " " .. -3 * size_factor .. " m " .. ( lig_add + 2 * size_factor ) ..  " " .. -3 * size_factor .. " l " .. ( lig_add + 2 * size_factor ) .. " " .. -4 * size_factor .. " l " .. ( lig_add - 2 * size_factor ) ..  " " .. -4 * size_factor .. " l " .. color .. " f Q"
            else
                DATA = "q " .. lig_add ..  " 0 m " .. lig_add + 2 * size_factor ..  " " .. -3 * size_factor .. " l " .. lig_add - 2 * size_factor .. " " .. -3 * size_factor .. " l " .. color .. "  f Q"
            end
            DIR ( prev_next_glyph ).data = DATA
            in_use()
        end
    end
    return head
end

local function make_hyphens ( head )
    for n in T_ID ( DISC, head ) do
        local REPLACE = n.replace
        for some_node in T ( REPLACE ) do
            REM ( REPLACE, some_node )
        end
        local PRE = n.pre
        for some_node in T_GLYPH ( PRE ) do
            REPLACE = INS_A ( REPLACE, REPLACE, COPY ( some_node ) )
        end
        local POST = n.post
        for some_node in T_GLYPH ( POST ) do
            REPLACE = INS_A ( REPLACE, REPLACE, COPY ( some_node ) )
        end
        n.replace = REPLACE
    end
end

function showhyphenation_start ()
    if make then
        ATC ( "ligaturing", make_hyphens, "make hyphens" )
    else
        ATC ( "post_linebreak_filter", hyphenation_points, "show hyphenation points in postline", 1 )
        ATC ( "hpack_filter", hyphenation_points, "show hyphenation points in hpack" )
    end
end
