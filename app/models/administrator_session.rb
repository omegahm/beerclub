class AdministratorSession < Authlogic::Session::Base
  include ActiveModel::Naming

  def parents
    []
  end

  def name
    'AdministratorSession'
  end

  def to_key
    new_record? ? nil : [send(self.class.primary_key)]
  end

  def persisted?
    false
  end
end
