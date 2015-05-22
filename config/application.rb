class Application < Roda
  plugin :action
  plugin :all_verbs
  plugin :symbolized_params

  def self.inherited(base)
    super
    base.extend(Forwardable)
    base.send(:detach_container)
  end
end
