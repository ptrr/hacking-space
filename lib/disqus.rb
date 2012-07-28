class Disqus

  def self.id(id, wp)
    if wp
      "#{wp} http://peterderuijter.com/?p=#{wp}"
    else
      id
    end
  end

end
