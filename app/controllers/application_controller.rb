class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "my_templates/homepage.html.erb" })
  end

  def text_qr 
    # parameters: {"content"=>"something"}
    @user_text = params.fetch("content")

    @qrcode = RQRCode::QRCode.new(@user_text)

    render({ :template => "my_templates/text.html.erb"})
  end  

  def url_qr

    @user_text = params.fetch("content")

    @qrcode = RQRCode::QRCode.new(@user_text)

    render({ :template => "my_templates/url.html.erb"})
  end
  
  def wifi_qr

    @user_text = params.fetch("content")

    @qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{@user_text};P:#{@user_text};;")

    render({ :template => "my_templates/wifi.html.erb"})
  end  

  def sms_qr

    @user_text = params.fetch("content")

    @qrcode = RQRCode::QRCode.new("SMSTO: #{@user_text}:Hi #{@user_text}")

    render({ :template => "my_templates/sms.html.erb"})
  end  
end
