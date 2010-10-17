class Class

  def to_i18n_error_key
    "exceptions.#{self.to_s.downcase.gsub(/::/,'.')}"
  end

end

