#!/usr/bin/env texlua

--[[
     For documentation and usage of the l3build system
     see l3build.pdf

     It is not used to upload to CTAN, instead make-ctan-zip.sh  builds that
--]]

module = "tlc3-examples"

sourcefiles  = {"NORMAL/*", "SPECIAL/*", "*.bib", "SUPPORT/*", "BOOK-PDFS/*"}

typesetfiles = { "1-3-1.ltx", "1-3-2.ltx2", "1-3-3.ltx", "1-3-4.ltx",
  "1-3-5.ltx", "1-3-6.ltx", "10-1-1.ltx", "10-1-2.ltx", "10-10-2.ltx",
  "10-10-3.ltx", "10-10-4.ltx", "10-10-5.ltx", "10-10-6.ltx",
  "10-12-2.ltx", "10-12-3.ltx", "10-13-1.ltx", "10-13-10.ltx",
  "10-13-11.ltx", "10-13-12.ltx", "10-13-13.ltx", "10-13-14.ltx",
  "10-13-15.ltx", "10-13-16.ltx", "10-13-2.ltx", "10-13-3.ltx",
  "10-13-4.ltx", "10-13-5.ltx", "10-13-6.ltx", "10-13-7.ltx",
  "10-13-8.ltx", "10-13-9.ltx", "10-2-5.ltx", "10-8-1.ltx",
  "10-9-1.ltx", "10-9-2.ltx", "11-2-1.ltx", "11-2-10.ltx",
  "11-2-11.ltx", "11-2-12.ltx", "11-2-13.ltx", "11-2-14.ltx",
  "11-2-15.ltx", "11-2-16.ltx", "11-2-17.ltx", "11-2-18.ltx",
  "11-2-19.ltx", "11-2-2.ltx", "11-2-20.ltx", "11-2-21.ltx",
  "11-2-22.ltx", "11-2-23.ltx", "11-2-24.ltx", "11-2-25.ltx",
  "11-2-26.ltx", "11-2-27.ltx", "11-2-28.ltx", "11-2-29.ltx",
  "11-2-3.ltx", "11-2-30.ltx", "11-2-31.ltx", "11-2-32.ltx",
  "11-2-33.ltx", "11-2-34.ltx", "11-2-35.ltx", "11-2-36.ltx",
  "11-2-37.ltx", "11-2-38.ltx", "11-2-39.ltx", "11-2-4.ltx",
  "11-2-40.ltx", "11-2-5.ltx", "11-2-6.ltx", "11-2-7.ltx",
  "11-2-8.ltx", "11-2-9.ltx", "11-3-1.ltx", "11-3-10.ltx",
  "11-3-11.ltx", "11-3-12.ltx", "11-3-13.ltx", "11-3-14.ltx",
  "11-3-15.ltx", "11-3-2.ltx", "11-3-3.ltx", "11-3-4.ltx",
  "11-3-5.ltx", "11-3-6.ltx", "11-3-7.ltx", "11-3-8.ltx",
  "11-3-9.ltx", "11-4-1.ltx", "11-4-10.ltx", "11-4-11.ltx",
  "11-4-12.ltx", "11-4-13.ltx", "11-4-14.ltx", "11-4-15.ltx",
  "11-4-16.ltx", "11-4-17.ltx", "11-4-18.ltx", "11-4-19.ltx",
  "11-4-2.ltx", "11-4-20.ltx", "11-4-21.ltx", "11-4-22.ltx",
  "11-4-23.ltx", "11-4-24.ltx", "11-4-25.ltx", "11-4-26.ltx",
  "11-4-27.ltx", "11-4-28.ltx", "11-4-29.ltx", "11-4-3.ltx",
  "11-4-30.ltx", "11-4-31.ltx", "11-4-32.ltx", "11-4-33.ltx",
  "11-4-34.ltx", "11-4-35.ltx", "11-4-36.ltx", "11-4-37.ltx",
  "11-4-38.ltx", "11-4-39.ltx", "11-4-4.ltx", "11-4-40.ltx",
  "11-4-41.ltx", "11-4-42.ltx", "11-4-5.ltx", "11-4-6.ltx",
  "11-4-7.ltx", "11-4-8.ltx", "11-4-9.ltx", "11-5-1.ltx",
  "11-5-10.ltx", "11-5-11.ltx", "11-5-12.ltx", "11-5-13.ltx",
  "11-5-14.ltx", "11-5-15.ltx", "11-5-16.ltx", "11-5-17.ltx",
  "11-5-18.ltx", "11-5-19.ltx", "11-5-2.ltx", "11-5-3.ltx",
  "11-5-4.ltx", "11-5-5.ltx", "11-5-6.ltx", "11-5-7.ltx",
  "11-5-8.ltx", "11-5-9.ltx", "11-6-1.ltx", "11-6-2.ltx",
  "11-6-3.ltx", "11-6-4.ltx", "11-7-1.ltx", "11-7-10.ltx",
  "11-7-11.ltx", "11-7-12.ltx", "11-7-13.ltx", "11-7-14.ltx",
  "11-7-15.ltx", "11-7-16.ltx", "11-7-17.ltx", "11-7-18.ltx",
  "11-7-19.ltx", "11-7-2.ltx", "11-7-20.ltx", "11-7-21.ltx",
  "11-7-22.ltx", "11-7-23.ltx", "11-7-24.ltx", "11-7-25.ltx",
  "11-7-3.ltx", "11-7-4.ltx", "11-7-5.ltx", "11-7-6.ltx",
  "11-7-7.ltx", "11-7-8.ltx", "11-7-9.ltx", "11-8-1.ltx",
  "11-8-10.ltx", "11-8-11.ltx", "11-8-2.ltx", "11-8-3.ltx",
  "11-8-4.ltx", "11-8-5.ltx", "11-8-6.ltx", "11-8-7.ltx",
  "11-8-8.ltx", "11-8-9.ltx", "12-1-1.ltx", "12-1-10.ltx",
  "12-1-11.ltx", "12-1-12.ltx", "12-1-13.ltx", "12-1-2.ltx",
  "12-1-3.ltx", "12-1-4.ltx", "12-1-5.ltx", "12-1-6.ltx",
  "12-1-7.ltx", "12-1-8.ltx", "12-1-fig.ltx", "12-10-fig.ltx",
  "12-11-fig.ltx", "12-12-fig.ltx", "12-13-fig.ltx", "12-14-fig.ltx",
  "12-15-fig.ltx", "12-16-fig.ltx", "12-17-fig.ltx", "12-18-fig.ltx",
  "12-19-fig.ltx", "12-2-1.ltx", "12-2-2.ltx", "12-2-3.ltx",
  "12-2-4.ltx", "12-2-5.ltx", "12-2-6.ltx", "12-2-fig.ltx",
  "12-20-fig.ltx", "12-21-fig.ltx", "12-22-fig.ltx", "12-23-fig.ltx",
  "12-25-fig.ltx", "12-26-fig.ltx", "12-27-fig.ltx", "12-28-fig.ltx",
  "12-29-fig.ltx", "12-3-10.ltx", "12-3-11.ltx", "12-3-12.ltx",
  "12-3-13.ltx", "12-3-14.ltx", "12-3-15.ltx", "12-3-16.ltx",
  "12-3-17.ltx", "12-3-18.ltx", "12-3-19.ltx", "12-3-2.ltx",
  "12-3-20.ltx", "12-3-21.ltx", "12-3-22.ltx", "12-3-23.ltx",
  "12-3-24.ltx", "12-3-25.ltx", "12-3-26.ltx", "12-3-27.ltx",
  "12-3-28.ltx", "12-3-29.ltx", "12-3-3.ltx", "12-3-30.ltx",
  "12-3-31.ltx", "12-3-32.ltx", "12-3-33.ltx", "12-3-34.ltx",
  "12-3-35.ltx", "12-3-36.ltx", "12-3-37.ltx", "12-3-38.ltx",
  "12-3-39.ltx", "12-3-4.ltx", "12-3-40.ltx", "12-3-5.ltx",
  "12-3-6.ltx", "12-3-7.ltx", "12-3-8.ltx", "12-3-9.ltx",
  "12-3-fig.ltx", "12-30-fig.ltx", "12-31-fig.ltx", "12-32-fig.ltx",
  "12-33-fig.ltx", "12-34-fig.ltx", "12-35-fig.ltx", "12-36-fig.ltx",
  "12-37-fig.ltx", "12-38-fig.ltx", "12-39-fig.ltx", "12-4-1.ltx",
  "12-4-2.ltx", "12-4-3.ltx", "12-4-4.ltx", "12-4-5.ltx",
  "12-4-6.ltx", "12-4-fig.ltx", "12-40-fig.ltx", "12-41-fig.ltx",
  "12-42-fig.ltx", "12-43-fig.ltx", "12-44-fig.ltx", "12-45-fig.ltx",
  "12-46-fig.ltx", "12-47-fig.ltx", "12-48-fig.ltx", "12-49-fig.ltx",
  "12-5-fig.ltx", "12-50-fig.ltx", "12-51-fig.ltx", "12-52-fig.ltx",
  "12-6-fig.ltx", "12-7-fig.ltx", "12-8-fig.ltx", "12-9-fig.ltx",
  "13-2-1.ltx", "13-2-2.ltx", "13-2-3.ltx", "13-2-4.ltx",
  "13-2-5.ltx", "13-2-6.ltx", "13-2-7.ltx", "13-3-1.ltx",
  "13-3-10.ltx", "13-3-11.ltx", "13-3-12.ltx2", "13-3-13.ltx",
  "13-3-14.ltx", "13-3-15.ltx", "13-3-16.ltx", "13-3-17.ltx",
  "13-3-18.ltx", "13-3-19.ltx", "13-3-2.ltx", "13-3-20.ltx",
  "13-3-21.ltx", "13-3-22.ltx", "13-3-23.ltx", "13-3-24.ltx",
  "13-3-25.ltx", "13-3-26.ltx", "13-3-27.ltx", "13-3-28.ltx",
  "13-3-29.ltx", "13-3-3.ltx", "13-3-30.ltx", "13-3-4.ltx",
  "13-3-5.ltx", "13-3-6.ltx", "13-3-7.ltx", "13-3-8.ltx",
  "13-3-9.ltx", "13-4-1.ltx", "13-4-2.ltx", "13-4-3.ltx",
  "13-5-1.ltx", "13-5-2.ltx", "13-5-3.ltx", "13-6-1.ltx",
  "15-1-1.ltx", "15-3-1.ltx", "15-3-2.ltx", "15-3-3.ltx",
  "15-3-4.ltx", "15-3-5.ltx", "15-6-1.ltx", "15-6-2.ltx",
  "15-7-1.ltx", "15-7-10.ltx", "15-7-100.ltx", "15-7-101.ltx",
  "15-7-102.ltx", "15-7-103.ltx", "15-7-104.ltx", "15-7-105.ltx",
  "15-7-106.ltx", "15-7-107.ltx", "15-7-108.ltx", "15-7-109.ltx",
  "15-7-11.ltx", "15-7-110.ltx", "15-7-111.ltx", "15-7-112.ltx",
  "15-7-113.ltx", "15-7-114.ltx", "15-7-115.ltx", "15-7-116.ltx",
  "15-7-117.ltx", "15-7-118.ltx", "15-7-119.ltx", "15-7-12.ltx",
  "15-7-120.ltx", "15-7-121.ltx", "15-7-122.ltx", "15-7-123.ltx",
  "15-7-124.ltx", "15-7-125.ltx", "15-7-126.ltx", "15-7-127.ltx",
  "15-7-128.ltx", "15-7-129.ltx", "15-7-13.ltx", "15-7-130.ltx",
  "15-7-131.ltx", "15-7-132.ltx", "15-7-133.ltx", "15-7-134.ltx",
  "15-7-135.ltx", "15-7-136.ltx", "15-7-137.ltx", "15-7-138.ltx",
  "15-7-139.ltx", "15-7-14.ltx", "15-7-140.ltx", "15-7-141.ltx",
  "15-7-15.ltx", "15-7-16.ltx", "15-7-17.ltx", "15-7-18.ltx",
  "15-7-19.ltx", "15-7-2.ltx", "15-7-20.ltx", "15-7-21.ltx",
  "15-7-22.ltx", "15-7-23.ltx", "15-7-24.ltx", "15-7-25.ltx",
  "15-7-26.ltx", "15-7-27.ltx", "15-7-28.ltx", "15-7-29.ltx",
  "15-7-3.ltx", "15-7-30.ltx", "15-7-31.ltx", "15-7-32.ltx",
  "15-7-33.ltx", "15-7-34.ltx", "15-7-35.ltx", "15-7-36.ltx",
  "15-7-37.ltx", "15-7-38.ltx", "15-7-39.ltx", "15-7-4.ltx",
  "15-7-40.ltx", "15-7-41.ltx", "15-7-42.ltx", "15-7-43.ltx",
  "15-7-44.ltx", "15-7-45.ltx", "15-7-46.ltx", "15-7-47.ltx",
  "15-7-48.ltx", "15-7-49.ltx", "15-7-5.ltx", "15-7-50.ltx",
  "15-7-51.ltx", "15-7-52.ltx", "15-7-53.ltx", "15-7-54.ltx",
  "15-7-55.ltx", "15-7-56.ltx", "15-7-57.ltx", "15-7-58.ltx",
  "15-7-59.ltx", "15-7-6.ltx", "15-7-60.ltx", "15-7-61.ltx",
  "15-7-62.ltx", "15-7-63.ltx", "15-7-64.ltx", "15-7-65.ltx",
  "15-7-66.ltx", "15-7-67.ltx", "15-7-68.ltx", "15-7-69.ltx",
  "15-7-7.ltx", "15-7-70.ltx", "15-7-71.ltx", "15-7-72.ltx",
  "15-7-73.ltx", "15-7-74.ltx", "15-7-75.ltx", "15-7-76.ltx",
  "15-7-77.ltx", "15-7-78.ltx", "15-7-79.ltx", "15-7-8.ltx",
  "15-7-80.ltx", "15-7-81.ltx", "15-7-82.ltx", "15-7-83.ltx",
  "15-7-84.ltx", "15-7-85.ltx", "15-7-86.ltx", "15-7-87.ltx",
  "15-7-88.ltx", "15-7-89.ltx", "15-7-9.ltx", "15-7-90.ltx",
  "15-7-91.ltx", "15-7-92.ltx", "15-7-93.ltx", "15-7-94.ltx",
  "15-7-95.ltx", "15-7-96.ltx", "15-7-97.ltx", "15-7-98.ltx",
  "15-7-99.ltx", "16-1-1.ltx", "16-1-2.ltx", "16-1-3.ltx",
  "16-1-4.ltx", "16-2-1.ltx", "16-2-10.ltx", "16-2-11.ltx",
  "16-2-12.ltx", "16-2-13.ltx", "16-2-14.ltx", "16-2-15.ltx",
  "16-2-16.ltx", "16-2-17.ltx", "16-2-18.ltx", "16-2-19.ltx",
  "16-2-2.ltx", "16-2-20.ltx", "16-2-21.ltx", "16-2-22.ltx",
  "16-2-23.ltx", "16-2-24.ltx", "16-2-25.ltx", "16-2-26.ltx",
  "16-2-27.ltx", "16-2-28.ltx", "16-2-29.ltx", "16-2-3.ltx",
  "16-2-30.ltx", "16-2-4.ltx", "16-2-5.ltx", "16-2-6.ltx",
  "16-2-7.ltx", "16-2-8.ltx", "16-2-9.ltx", "16-3-1.ltx",
  "16-3-10.ltx", "16-3-11.ltx", "16-3-12.ltx", "16-3-13.ltx",
  "16-3-14.ltx", "16-3-15.ltx", "16-3-16.ltx", "16-3-17.ltx",
  "16-3-18.ltx", "16-3-19.ltx", "16-3-2.ltx", "16-3-20.ltx",
  "16-3-21.ltx", "16-3-22.ltx", "16-3-23.ltx", "16-3-24.ltx",
  "16-3-25.ltx", "16-3-26.ltx", "16-3-27.ltx", "16-3-28.ltx",
  "16-3-29.ltx", "16-3-3.ltx", "16-3-30.ltx", "16-3-31.ltx",
  "16-3-32.ltx", "16-3-33.ltx", "16-3-4.ltx", "16-3-5.ltx",
  "16-3-6.ltx", "16-3-7.ltx", "16-3-8.ltx", "16-3-9.ltx",
  "16-4-1.ltx", "16-4-10.ltx", "16-4-2.ltx", "16-4-3.ltx",
  "16-4-4.ltx", "16-4-5.ltx", "16-4-6.ltx", "16-4-7.ltx",
  "16-4-8.ltx", "16-4-9.ltx", "16-5-1.ltx", "16-5-10.ltx",
  "16-5-11.ltx", "16-5-12.ltx", "16-5-13.ltx", "16-5-14.ltx",
  "16-5-15.ltx", "16-5-16.ltx", "16-5-17.ltx", "16-5-18.ltx",
  "16-5-19.ltx", "16-5-2.ltx", "16-5-20.ltx", "16-5-21.ltx",
  "16-5-22.ltx", "16-5-23.ltx", "16-5-24.ltx2", "16-5-25.ltx2",
  "16-5-26.ltx2", "16-5-27.ltx", "16-5-28.ltx", "16-5-29.ltx2",
  "16-5-3.ltx", "16-5-30.ltx", "16-5-31.ltx", "16-5-32.ltx",
  "16-5-33.ltx", "16-5-34.ltx", "16-5-35.ltx", "16-5-36.ltx",
  "16-5-37.ltx", "16-5-38.ltx", "16-5-39.ltx", "16-5-4.ltx",
  "16-5-40.ltx", "16-5-41.ltx", "16-5-42.ltx", "16-5-43.ltx",
  "16-5-44.ltx", "16-5-45.ltx", "16-5-46.ltx", "16-5-47.ltx",
  "16-5-48.ltx", "16-5-49.ltx", "16-5-5.ltx", "16-5-50.ltx",
  "16-5-51.ltx", "16-5-52.ltx", "16-5-53.ltx", "16-5-54.ltx",
  "16-5-6.ltx", "16-5-7.ltx", "16-5-8.ltx", "16-5-9.ltx",
  "16-6-1.ltx", "16-6-2.ltx", "16-6-3.ltx", "16-6-4.ltx",
  "16-6-5.ltx", "16-6-6.ltx", "16-6-7.ltx", "16-6-8.ltx",
  "16-7-1.ltx", "16-7-10.ltx", "16-7-11.ltx", "16-7-12.ltx",
  "16-7-13.ltx", "16-7-14.ltx", "16-7-15.ltx", "16-7-16.ltx",
  "16-7-17.ltx", "16-7-18.ltx", "16-7-19.ltx", "16-7-2.ltx",
  "16-7-20.ltx", "16-7-21.ltx", "16-7-22.ltx", "16-7-23.ltx",
  "16-7-24.ltx", "16-7-25.ltx", "16-7-26.ltx", "16-7-27.ltx",
  "16-7-28.ltx", "16-7-29.ltx", "16-7-3.ltx", "16-7-30.ltx2",
  "16-7-31.ltx", "16-7-32.ltx", "16-7-33.ltx", "16-7-34.ltx",
  "16-7-35.ltx", "16-7-36.ltx", "16-7-37.ltx", "16-7-38.ltx",
  "16-7-39.ltx", "16-7-4.ltx", "16-7-40.ltx", "16-7-41.ltx",
  "16-7-42.ltx", "16-7-5.ltx", "16-7-6.ltx", "16-7-7.ltx",
  "16-7-8.ltx", "16-7-9.ltx", "16-8-10.ltx", "16-8-11.ltx",
  "16-8-2.ltx", "16-8-3.ltx", "16-8-4.ltx2", "16-8-5.ltx2",
  "16-8-6.ltx2", "16-8-7.ltx2", "16-8-8.ltx", "16-8-9.ltx",
  "17-4-1.ltx", "17-4-2.ltx", "2-1-1.ltx", "2-1-2.ltx", "2-1-3.ltx",
  "2-2-1.ltx", "2-2-10.ltx", "2-2-11.ltx", "2-2-12.ltx", "2-2-13.ltx",
  "2-2-14.ltx", "2-2-15.ltx", "2-2-16.ltx", "2-2-17.ltx2",
  "2-2-18.ltx", "2-2-19.ltx", "2-2-2.ltx", "2-2-20.ltx", "2-2-21.ltx",
  "2-2-22.ltx", "2-2-3.ltx", "2-2-4.ltx", "2-2-5.ltx", "2-2-6.ltx",
  "2-2-7.ltx", "2-2-8.ltx", "2-2-9.ltx", "2-3-1.ltx2", "2-3-10.ltx",
  "2-3-11.ltx", "2-3-12.ltx", "2-3-13.ltx", "2-3-14.ltx",
  "2-3-15.ltx", "2-3-16.ltx", "2-3-2.ltx", "2-3-3.ltx", "2-3-4.ltx",
  "2-3-5.ltx", "2-3-6.ltx", "2-3-7.ltx", "2-3-8.ltx", "2-3-9.ltx",
  "2-4-1.ltx", "2-4-10.ltx", "2-4-11.ltx", "2-4-12.ltx2",
  "2-4-13.ltx", "2-4-14.ltx", "2-4-15.ltx", "2-4-16.ltx",
  "2-4-17.ltx", "2-4-18.ltx", "2-4-19.ltx", "2-4-2.ltx", "2-4-20.ltx",
  "2-4-21.ltx", "2-4-3.ltx", "2-4-4.ltx2", "2-4-5.ltx2", "2-4-6.ltx",
  "2-4-7.ltx", "2-4-8.ltx", "2-4-9.ltx", "3-1-1.ltx", "3-1-10.ltx",
  "3-1-11.ltx", "3-1-12.ltx", "3-1-13.ltx", "3-1-14.ltx",
  "3-1-15.ltx", "3-1-16.ltx", "3-1-17.ltx", "3-1-18.ltx",
  "3-1-19.ltx", "3-1-2.ltx", "3-1-20.ltx", "3-1-21.ltx", "3-1-22.ltx",
  "3-1-23.ltx", "3-1-3.ltx", "3-1-4.ltx", "3-1-5.ltx", "3-1-6.ltx",
  "3-1-7.ltx", "3-1-8.ltx", "3-1-9.ltx", "3-2-1.ltx", "3-2-2.ltx",
  "3-2-3.ltx", "3-2-4.ltx", "3-2-5.ltx", "3-2-6.ltx", "3-2-7.ltx",
  "3-2-8.ltx", "3-2-9.ltx", "3-3-1.ltx", "3-3-10.ltx", "3-3-11.ltx",
  "3-3-12.ltx", "3-3-13.ltx", "3-3-14.ltx", "3-3-15.ltx",
  "3-3-16.ltx", "3-3-17.ltx", "3-3-18.ltx", "3-3-19.ltx", "3-3-2.ltx",
  "3-3-20.ltx", "3-3-21.ltx", "3-3-22.ltx", "3-3-23.ltx",
  "3-3-24.ltx", "3-3-25.ltx", "3-3-26.ltx", "3-3-27.ltx",
  "3-3-28.ltx", "3-3-29.ltx", "3-3-3.ltx", "3-3-30.ltx", "3-3-31.ltx",
  "3-3-32.ltx", "3-3-33.ltx", "3-3-34.ltx", "3-3-35.ltx",
  "3-3-36.ltx", "3-3-37.ltx", "3-3-38.ltx", "3-3-39.ltx", "3-3-4.ltx",
  "3-3-5.ltx", "3-3-6.ltx", "3-3-7.ltx", "3-3-8.ltx", "3-3-9.ltx",
  "3-4-1.ltx", "3-4-10.ltx", "3-4-11.ltx", "3-4-12.ltx", "3-4-13.ltx",
  "3-4-14.ltx", "3-4-15.ltx", "3-4-16.ltx", "3-4-17.ltx",
  "3-4-18.ltx", "3-4-19.ltx", "3-4-2.ltx", "3-4-20.ltx", "3-4-21.ltx",
  "3-4-22.ltx", "3-4-23.ltx", "3-4-24.ltx", "3-4-25.ltx",
  "3-4-26.ltx", "3-4-27.ltx", "3-4-28.ltx", "3-4-29.ltx", "3-4-3.ltx",
  "3-4-30.ltx", "3-4-31.ltx", "3-4-32.ltx", "3-4-33.ltx",
  "3-4-34.ltx", "3-4-35.ltx", "3-4-36.ltx", "3-4-37.ltx",
  "3-4-38.ltx", "3-4-39.ltx", "3-4-4.ltx", "3-4-40.ltx", "3-4-41.ltx",
  "3-4-42.ltx", "3-4-43.ltx", "3-4-44.ltx", "3-4-45.ltx",
  "3-4-46.ltx", "3-4-47.ltx", "3-4-5.ltx", "3-4-6.ltx", "3-4-7.ltx",
  "3-4-8.ltx", "3-4-9.ltx", "3-5-1.ltx", "3-5-10.ltx", "3-5-11.ltx",
  "3-5-12.ltx", "3-5-13.ltx2", "3-5-14.ltx2", "3-5-15.ltx",
  "3-5-16.ltx", "3-5-17.ltx", "3-5-18.ltx", "3-5-19.ltx", "3-5-2.ltx",
  "3-5-20.ltx", "3-5-21.ltx", "3-5-22.ltx", "3-5-23.ltx",
  "3-5-24.ltx2", "3-5-25.ltx2", "3-5-26.ltx2", "3-5-27.ltx",
  "3-5-28.ltx", "3-5-29.ltx", "3-5-3.ltx", "3-5-30.ltx2",
  "3-5-31.ltx2", "3-5-32.ltx", "3-5-33.ltx2", "3-5-34.ltx",
  "3-5-35.ltx", "3-5-36.ltx", "3-5-37.ltx", "3-5-38.ltx",
  "3-5-39.ltx", "3-5-4.ltx", "3-5-40.ltx", "3-5-41.ltx",
  "3-5-42.ltx2", "3-5-43.ltx", "3-5-44.ltx", "3-5-45.ltx",
  "3-5-46.ltx", "3-5-47.ltx", "3-5-48.ltx", "3-5-5.ltx", "3-5-6.ltx",
  "3-5-7.ltx", "3-5-8.ltx2", "3-5-9.ltx", "3-6-1.ltx", "3-6-10.ltx",
  "3-6-11.ltx", "3-6-12.ltx", "3-6-13.ltx2", "3-6-14.ltx",
  "3-6-15.ltx", "3-6-16.ltx", "3-6-17.ltx", "3-6-18.ltx",
  "3-6-19.ltx", "3-6-2.ltx", "3-6-3.ltx", "3-6-4.ltx", "3-6-5.ltx",
  "3-6-6.ltx", "3-6-7.ltx", "3-6-8.ltx", "3-6-9.ltx", "4-1-1.ltx",
  "4-1-10.ltx", "4-1-11.ltx", "4-1-12.ltx", "4-1-13.ltx",
  "4-1-14.ltx", "4-1-15.ltx", "4-1-16.ltx", "4-1-17.ltx",
  "4-1-18.ltx", "4-1-19.ltx", "4-1-2.ltx", "4-1-20.ltx", "4-1-21.ltx",
  "4-1-22.ltx", "4-1-23.ltx", "4-1-24.ltx", "4-1-25.ltx",
  "4-1-26.ltx", "4-1-27.ltx", "4-1-28.ltx", "4-1-29.ltx", "4-1-3.ltx",
  "4-1-30.ltx", "4-1-31.ltx", "4-1-32.ltx", "4-1-33.ltx",
  "4-1-34.ltx", "4-1-35.ltx", "4-1-36.ltx", "4-1-37.ltx",
  "4-1-38.ltx", "4-1-39.ltx", "4-1-4.ltx", "4-1-40.ltx", "4-1-41.ltx",
  "4-1-42.ltx", "4-1-43.ltx", "4-1-44.ltx", "4-1-45.ltx",
  "4-1-46.ltx", "4-1-47.ltx", "4-1-48.ltx", "4-1-49.ltx", "4-1-5.ltx",
  "4-1-50.ltx", "4-1-51.ltx", "4-1-52.ltx", "4-1-53.ltx",
  "4-1-54.ltx", "4-1-55.ltx", "4-1-6.ltx", "4-1-7.ltx", "4-1-8.ltx",
  "4-1-9.ltx", "4-2-1.ltx", "4-2-10.ltx", "4-2-11.ltx", "4-2-12.ltx",
  "4-2-13.ltx", "4-2-14.ltx", "4-2-15.ltx", "4-2-16.ltx",
  "4-2-17.ltx", "4-2-18.ltx", "4-2-19.ltx", "4-2-2.ltx", "4-2-20.ltx",
  "4-2-21.ltx", "4-2-22.ltx", "4-2-23.ltx", "4-2-24.ltx",
  "4-2-25.ltx", "4-2-26.ltx", "4-2-27.ltx", "4-2-28.ltx",
  "4-2-29.ltx", "4-2-3.ltx", "4-2-30.ltx", "4-2-31.ltx", "4-2-32.ltx",
  "4-2-33.ltx", "4-2-34.ltx", "4-2-35.ltx", "4-2-36.ltx",
  "4-2-37.ltx", "4-2-38.ltx", "4-2-39.ltx", "4-2-4.ltx", "4-2-40.ltx",
  "4-2-41.ltx", "4-2-42.ltx", "4-2-43.ltx", "4-2-44.ltx",
  "4-2-45.ltx", "4-2-46.ltx", "4-2-47.ltx", "4-2-48.ltx",
  "4-2-49.ltx", "4-2-5.ltx", "4-2-50.ltx", "4-2-51.ltx", "4-2-52.ltx",
  "4-2-53.ltx", "4-2-54.ltx", "4-2-55.ltx", "4-2-56.ltx",
  "4-2-57.ltx", "4-2-58.ltx", "4-2-59.ltx", "4-2-6.ltx", "4-2-60.ltx",
  "4-2-61.ltx", "4-2-7.ltx", "4-2-8.ltx", "4-2-9.ltx", "4-3-1.ltx",
  "4-3-10.ltx", "4-3-11.ltx", "4-3-12.ltx", "4-3-13.ltx",
  "4-3-14.ltx", "4-3-15.ltx", "4-3-16.ltx", "4-3-17.ltx",
  "4-3-18.ltx", "4-3-19.ltx", "4-3-2.ltx", "4-3-20.ltx", "4-3-21.ltx",
  "4-3-22.ltx", "4-3-23.ltx", "4-3-24.ltx", "4-3-25.ltx",
  "4-3-26.ltx", "4-3-27.ltx", "4-3-28.ltx", "4-3-29.ltx", "4-3-3.ltx",
  "4-3-30.ltx", "4-3-31.ltx", "4-3-32.ltx", "4-3-33.ltx",
  "4-3-34.ltx", "4-3-35.ltx", "4-3-36.ltx", "4-3-4.ltx", "4-3-5.ltx",
  "4-3-6.ltx", "4-3-7.ltx", "4-3-8.ltx", "4-3-9.ltx", "4-4-1.ltx",
  "4-4-2.ltx", "4-4-3.ltx", "4-4-4.ltx", "4-4-5.ltx", "5-1-1.ltx",
  "5-2-1.ltx", "5-2-10.ltx", "5-2-2.ltx", "5-2-3.ltx", "5-2-4.ltx",
  "5-2-5.ltx", "5-2-6.ltx2", "5-2-7.ltx2", "5-2-8.ltx", "5-2-9.ltx2",
  "5-3-1.ltx2", "5-3-2.ltx2", "5-3-3.ltx2", "5-3-4.ltx2", "5-3-5.ltx",
  "5-4-1.ltx", "5-4-10.ltx2", "5-4-11.ltx2", "5-4-12.ltx2",
  "5-4-13.ltx", "5-4-14.ltx2", "5-4-15.ltx2", "5-4-16.ltx2",
  "5-4-17.ltx", "5-4-2.ltx", "5-4-3.ltx", "5-4-4.ltx2", "5-4-5.ltx2",
  "5-4-6.ltx2", "5-4-7.ltx2", "5-4-8.ltx2", "5-4-9.ltx2",
  "5-5-1.ltx2", "5-5-2.ltx2", "5-5-3.ltx", "5-5-4.ltx", "5-5-5.ltx",
  "5-6-1.ltx2", "5-6-2.ltx2", "5-6-3.ltx2", "5-6-4.ltx2",
  "5-6-5.ltx2", "5-6-6.ltx2", "5-6-7.ltx2", "5-6-8.ltx2",
  "5-6-9.ltx2", "6-1-1.ltx", "6-1-2.ltx", "6-1-3.ltx", "6-1-4.ltx",
  "6-1-5.ltx", "6-1-6.ltx", "6-2-1.ltx", "6-2-10.ltx", "6-2-11.ltx",
  "6-2-12.ltx", "6-2-13.ltx", "6-2-14.ltx", "6-2-15.ltx",
  "6-2-16.ltx", "6-2-17.ltx", "6-2-18.ltx", "6-2-2.ltx", "6-2-3.ltx",
  "6-2-4.ltx", "6-2-5.ltx", "6-2-6.ltx", "6-2-7.ltx", "6-2-8.ltx",
  "6-2-9.ltx", "6-3-1.ltx", "6-3-10.ltx", "6-3-11.ltx", "6-3-2.ltx",
  "6-3-3.ltx", "6-3-4.ltx", "6-3-5.ltx", "6-3-6.ltx", "6-3-7.ltx",
  "6-3-8.ltx", "6-3-9.ltx", "6-4-1.ltx2", "6-4-2.ltx2", "6-4-3.ltx2",
  "6-4-4.ltx", "6-4-5.ltx2", "6-4-6.ltx2", "6-4-7.ltx2", "6-4-8.ltx2",
  "6-5-1.ltx", "6-5-2.ltx", "6-6-1.ltx", "6-6-10.ltx", "6-6-2.ltx",
  "6-6-3.ltx", "6-6-4.ltx", "6-6-5.ltx", "6-6-6.ltx", "6-6-7.ltx",
  "6-6-8.ltx", "6-6-9.ltx", "6-7-1.ltx", "6-7-10.ltx", "6-7-11.ltx",
  "6-7-12.ltx", "6-7-13.ltx", "6-7-14.ltx", "6-7-15.ltx",
  "6-7-16.ltx", "6-7-17.ltx", "6-7-18.ltx", "6-7-19.ltx", "6-7-2.ltx",
  "6-7-20.ltx", "6-7-21.ltx", "6-7-22.ltx", "6-7-3.ltx", "6-7-4.ltx",
  "6-7-5.ltx", "6-7-6.ltx", "6-7-7.ltx", "6-7-8.ltx", "6-7-9.ltx",
  "6-8-1.ltx", "6-8-2.ltx", "6-9-1.ltx", "6-9-2.ltx", "6-9-3.ltx",
  "6-9-4.ltx", "6-9-5.ltx", "6-9-6.ltx", "6-9-7.ltx", "6-9-8.ltx",
  "6-9-9.ltx", "7-3-1.ltx", "7-3-2.ltx", "7-3-3.ltx", "7-3-4.ltx2",
  "7-3-5.ltx", "7-3-6.ltx2", "7-3-7.ltx2", "7-3-8.ltx", "7-3-9.ltx",
  "7-4-1.ltx", "7-4-10.ltx", "7-4-11.ltx", "7-4-12.ltx", "7-4-13.ltx",
  "7-4-14.ltx", "7-4-15.ltx", "7-4-16.ltx", "7-4-17.ltx2",
  "7-4-2.ltx", "7-4-3.ltx", "7-4-4.ltx", "7-4-5.ltx", "7-4-6.ltx2",
  "7-4-7.ltx2", "7-4-8.ltx", "7-4-9.ltx", "7-5-1.ltx", "7-5-10.ltx",
  "7-5-11.ltx", "7-5-12.ltx", "7-5-13.ltx", "7-5-14.ltx",
  "7-5-15.ltx", "7-5-16.ltx", "7-5-2.ltx", "7-5-3.ltx", "7-5-4.ltx",
  "7-5-5.ltx", "7-5-6.ltx2", "7-5-7.ltx2", "7-5-8.ltx2", "7-5-9.ltx2",
  "8-1-1.ltx", "8-1-10.ltx", "8-1-11.ltx", "8-1-12.ltx", "8-1-13.ltx",
  "8-1-14.ltx", "8-1-15.ltx", "8-1-2.ltx", "8-1-3.ltx", "8-1-4.ltx",
  "8-1-5.ltx", "8-1-6.ltx", "8-1-7.ltx", "8-1-8.ltx", "8-1-9.ltx",
  "8-2-1.ltx", "8-2-10.ltx", "8-2-11.ltx", "8-2-12.ltx", "8-2-13.ltx",
  "8-2-14.ltx", "8-2-15.ltx", "8-2-16.ltx", "8-2-17.ltx",
  "8-2-18.ltx", "8-2-19.ltx", "8-2-2.ltx", "8-2-20.ltx", "8-2-21.ltx",
  "8-2-22.ltx", "8-2-23.ltx", "8-2-3.ltx", "8-2-4.ltx", "8-2-5.ltx",
  "8-2-6.ltx", "8-2-7.ltx", "8-2-8.ltx", "8-2-9.ltx", "8-3-1.ltx",
  "8-3-10.ltx", "8-3-11.ltx", "8-3-12.ltx", "8-3-13.ltx",
  "8-3-14.ltx", "8-3-15.ltx", "8-3-16.ltx", "8-3-17.ltx",
  "8-3-18.ltx", "8-3-2.ltx", "8-3-3.ltx", "8-3-4.ltx", "8-3-5.ltx",
  "8-3-6.ltx", "8-3-7.ltx", "8-3-8.ltx", "8-3-9.ltx", "8-4-1.ltx",
  "8-4-10.ltx", "8-4-11.ltx", "8-4-12.ltx", "8-4-13.ltx",
  "8-4-14.ltx", "8-4-15.ltx2", "8-4-16.ltx", "8-4-17.ltx",
  "8-4-18.ltx", "8-4-19.ltx", "8-4-2.ltx", "8-4-20.ltx", "8-4-21.ltx",
  "8-4-22.ltx2", "8-4-23.ltx", "8-4-24.ltx", "8-4-25.ltx",
  "8-4-26.ltx", "8-4-27.ltx", "8-4-28.ltx", "8-4-29.ltx", "8-4-3.ltx",
  "8-4-4.ltx", "8-4-5.ltx", "8-4-6.ltx", "8-4-7.ltx", "8-4-8.ltx",
  "8-4-9.ltx", "8-5-1.ltx", "8-5-10.ltx", "8-5-11.ltx", "8-5-12.ltx",
  "8-5-13.ltx", "8-5-14.ltx", "8-5-15.ltx", "8-5-16.ltx",
  "8-5-17.ltx", "8-5-18.ltx", "8-5-19.ltx", "8-5-2.ltx", "8-5-20.ltx",
  "8-5-21.ltx", "8-5-22.ltx", "8-5-23.ltx", "8-5-24.ltx",
  "8-5-25.ltx", "8-5-26.ltx", "8-5-3.ltx", "8-5-4.ltx", "8-5-5.ltx",
  "8-5-6.ltx", "8-5-7.ltx", "8-5-8.ltx", "8-5-9.ltx", "9-3-1.ltx",
  "9-3-10.ltx", "9-3-11.ltx", "9-3-12.ltx", "9-3-13.ltx",
  "9-3-14.ltx", "9-3-15.ltx", "9-3-2.ltx", "9-3-3.ltx", "9-3-4.ltx",
  "9-3-5.ltx", "9-3-6.ltx", "9-3-7.ltx", "9-3-8.ltx", "9-3-9.ltx",
  "9-4-1.ltx", "9-4-2.ltx", "9-4-3.ltx", "9-4-4.ltx", "9-4-5.ltx",
  "9-4-6.ltx", "9-4-7.ltx", "9-4-8.ltx", "9-5-1.ltx", "9-5-10.ltx",
  "9-5-11.ltx", "9-5-12.ltx", "9-5-13.ltx", "9-5-14.ltx",
  "9-5-15.ltx", "9-5-2.ltx", "9-5-3.ltx", "9-5-4.ltx", "9-5-5.ltx",
  "9-5-6.ltx", "9-5-7.ltx", "9-5-8.ltx", "9-5-9.ltx", "9-6-1.ltx",
  "9-6-10.ltx", "9-6-11.ltx", "9-6-12.ltx", "9-6-13.ltx",
  "9-6-14.ltx", "9-6-15.ltx", "9-6-16.ltx", "9-6-17.ltx",
  "9-6-18.ltx", "9-6-19.ltx", "9-6-2.ltx", "9-6-20.ltx", "9-6-21.ltx",
  "9-6-22.ltx", "9-6-23.ltx", "9-6-24.ltx", "9-6-25.ltx",
  "9-6-26.ltx", "9-6-27.ltx", "9-6-28.ltx", "9-6-3.ltx", "9-6-4.ltx",
  "9-6-5.ltx", "9-6-6.ltx", "9-6-7.ltx", "9-6-8.ltx", "9-6-9.ltx",
  "9-7-1.ltx", "9-7-2.ltx", "9-7-3.ltx", "A-1-1.ltx", "A-1-10.ltx",
  "A-1-11.ltx", "A-1-12.ltx", "A-1-13.ltx", "A-1-14.ltx",
  "A-1-15.ltx", "A-1-16.ltx", "A-1-17.ltx", "A-1-2.ltx", "A-1-3.ltx",
  "A-1-4.ltx", "A-1-5.ltx", "A-1-6.ltx", "A-1-7.ltx", "A-1-8.ltx",
  "A-1-9.ltx", "A-2-1.ltx", "A-2-10.ltx", "A-2-11.ltx", "A-2-12.ltx",
  "A-2-2.ltx", "A-2-3.ltx", "A-2-4.ltx", "A-2-5.ltx", "A-2-6.ltx",
  "A-2-7.ltx", "A-2-8.ltx", "A-2-9.ltx", "A-3-1.ltx", "A-3-10.ltx",
  "A-3-11.ltx", "A-3-12.ltx", "A-3-13.ltx", "A-3-14.ltx",
  "A-3-15.ltx", "A-3-16.ltx", "A-3-17.ltx", "A-3-18.ltx",
  "A-3-19.ltx", "A-3-2.ltx", "A-3-20.ltx", "A-3-21.ltx", "A-3-3.ltx",
  "A-3-4.ltx", "A-3-5.ltx", "A-3-6.ltx", "A-3-7.ltx", "A-3-8.ltx",
  "A-3-9.ltx", "A-4-1.ltx", "A-4-2.ltx", "A-4-3.ltx", "A-4-4.ltx",
  "A-4-5.ltx2", "A-4-6.ltx", "A-5-1.ltx", "A-5-2.ltx", "A-5-3.ltx",
  "A-5-4.ltx", "A-5-5.ltx", "A-5-6.ltx", "A-5-7.ltx2", "A-5-8.ltx",
  "A-5-9.ltx", "B-4-1.ltx", "B-4-2.ltx", "preface-II-1.ltx",
  "preface-II-2.ltx2", "preface-II-3.ltx", "preface-II-4.ltx",
  "preface-II-5.ltx", "preface-II-6.ltx" }


checkruns     = 0

typesetruns   = 4

specialtypesetting = specialtypesetting or {}
specialtypesetting["9-6-2.ltx"] = {cmd = "xelatex -interaction=nonstopmode"}
specialtypesetting["10-11-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-12-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-2-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-5-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-9-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["10-9-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-12-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-13-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-17-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-18-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-21-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-23-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-25-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-26-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-28-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-29-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-31-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-35-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-36-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-37-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-4-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-41-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-43-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-44-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-5-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["12-8-fig.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["13-5-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["4-2-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["4-2-58.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-3-12.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-4-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-4-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-1.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-10.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-11.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-12.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-13.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-14.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-15.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-16.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-17.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-18.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-19.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-20.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-21.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-22.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-23.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-24.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-25.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-26.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-27.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-28.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-3.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-4.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-5.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-6.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-7.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-8.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["9-6-9.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}
specialtypesetting["B-4-2.ltx"] = {cmd = "lualatex -interaction=nonstopmode"}

-- bibtex8 fails (returns positive errorlevel) when there are warnings

bibtexexe = "bibtex"
bibtexopts = ""

indexstyle = ""


-- Upload meta data
-- Don't use l3build ctan for the preparation but sh make-ctan-zip.sh  instead

uploadconfig = {
 pkg = module,
 version = "v1.0a",
 author = "Frank Mittelbach",
 license = "lppl1.3c",
 summary = "All examples from ``The LaTeX Companion'', third edition",
 ctanPath = "/info/examples/tlc3",
 repository = "https://github.com/FrankMittelbach/tlc3-examples",
 bugtracker = "https://github.com/FrankMittelbach/tlc3-examples/issues",
 uploader = "Frank Mittelbach",
 email = "frank.mittelbach@latex-project.org",
 update = true ,
}



if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
