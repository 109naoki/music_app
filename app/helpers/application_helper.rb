module ApplicationHelper

    # ページごとの完全なタイトルを返します。
    def full_title(page_title = '')
      base_title = "Music App"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end

    def avatar_url(user)
      return user.profile_photo unless user.profile_photo.nil?
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
    end

    def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <ul class="error_field " >
          <li class="error_msg">#{msg}</li>
        </ul>
      EOF
    end
    html.html_safe
  end
  end
