class Tao2streamController < ApplicationController
  def stream

    headers["Cache-Control"] ||= "no-cache"
    headers["Transfer-Encoding"] = "chunked"

    # 上記のheadersを書くかもしくは下記のrenderでもOK。headersのほうが余計な処理が入らないのでお勧めかな？？
    #render :text=>"", :stream => true

    # DLにする場合はここのコメントを外せばOK.ブラウザで順次出力されるのを確認できるようにあえて外しておきます。
    # headers.merge!(
    # 'Content-Type' => "text/csv; charset=Shift_JIS",
    # 'Content-Disposition' => "attachment; filename=\"test.csv\""
    # )

    self.response_body = Rack::Chunked::Body.new(Enumerator.new do |y|
      loop do
        y << "たおたお〜"
        sleep(1)
      end
    end)

  end
end
