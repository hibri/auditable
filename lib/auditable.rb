require 'state_machine'

module StateMachine::Auditable

  def self.setup
    StateMachine::Machine.send(:include, StateMachine::Auditable::AuditTrail)
  end

end

require 'auditable/audit_trail'

StateMachine::Auditable.setup