--- @since 26.5.6

local M = {}

function M:peek(job)
  local cover = ya.file_cache({ file = job.file, skip = 0 })
  if not cover then
    return
  end

  local cover_stat = fs.cha(cover)
  if not cover_stat or cover_stat.len == 0 then
    local file = job.file.path or job.file.cache or job.file.url.path or job.file.url
    local output, err = Command("ffmpeg")
      :arg({
        "-v",
        "error",
        "-threads",
        "1",
        "-i",
        tostring(file),
        "-map",
        "0:v:0?",
        "-an",
        "-sn",
        "-dn",
        "-frames:v",
        "1",
        "-q:v",
        "2",
        "-f",
        "image2",
        "-y",
        tostring(cover),
      })
      :output()
    if err or not output then
      return
    end
    cover_stat = fs.cha(cover)
  end

  if cover_stat and cover_stat.len > 0 then
    ya.image_show(cover, job.area)
  end
end

function M:seek() end

return M
