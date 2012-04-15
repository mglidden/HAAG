module LiveValidator
  
  def validate_field(field, value)
    instance = self.new(field => value)
    instance.valid?    
    if instance.errors[field].present?
      ajaxResponse = { :valid => false, field.to_sym => instance.errors[field] }
    else
      ajaxResponse = { :valid => true }
    end  
  end
  
end