# frozen_string_literal: true

# CWE-330
module Cwe330
  def edit_cwe330
    @vals = [rand(10)]
    @vals <<= Random.rand
    @seed = srand
    srand(@seed)
    r = Random.new
    @vals <<= r.rand
    render :cwe330
  end

  def update_cwe330
    redirect_to edit_attack_path(330)
  end
end
