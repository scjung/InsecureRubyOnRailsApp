# frozen_string_literal: true

# Helper functions forAttacks
module AttacksHelper
  # Dummy code for CWE-259: Hardcoded Password.
  def cwe259
    ActiveRecord::Base.establish_connection(
      adapter: 'mysql2',
      host: 'localhost',
      username: 'tim',
      password: 'scotch',
      database: 'db'
    )
  end
end
