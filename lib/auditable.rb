require 'state_machine'

module StateMachine::Auditable

  def self.setup
    StateMachine::Machine.send(:include, StateMachine::Auditable::AuditTrail)
  end

end

StateMachine::Auditable.setup