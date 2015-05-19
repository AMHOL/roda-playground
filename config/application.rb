class Application < Roda
  plugin :action

  def self.inherited(base)
    super
    base.extend(Forwardable)
    base.send(:detach_container)
    base.send(:def_delegators, base, :instance, :action, :register, :resolve)
  end
end
