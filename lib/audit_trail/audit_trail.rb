require 'state_machine'

module StateMachine::Auditable

  def self.setup
    StateMachine::Machine.send(:include, StateMachine::Auditable::AuditTrail)
  end

end


module StateMachine::Auditable::AuditTrail

  def setup_audit_trail(transition_class)
    @association = transition_class.to_s.tableize.split('/').last.to_sym
    owner_class.has_many(@association, :class_name => transition_class.to_s) unless owner_class.reflect_on_association(@association)
    self.after_transition do |object, transition|
      log(object, transition)
    end
  end

  def log(object, transition)
    # Let ActiveRecord manage the timestamp for us so it does the
    # right thing with regards to timezones.
    params = {:event => transition.event, :from => transition.from, :to => transition.to}
    puts @association
    if object.new_record?
      object.send(@association).build(params)
    else
      object.send(@association).create(params)
    end
    nil
  end
end

StateMachine::Auditable.setup