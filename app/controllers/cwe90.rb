# frozen_string_literal: true

# CWE-90
module Cwe90
  def edit_cwe90
    render :cwe90
  end

  def update_cwe90
    server = setup_ldap_server
    begin
      client = Net::LDAP.new
      client.port = 1389
      client.auth(@toplevel_user_dn, @toplevel_user_password)
      name = params[:name]
      if params[:defense] == '1'
        name = Net::LDAP::Filter.escape(name)
        rs = client.search(base: @domain, filter: "(cn=#{name})")
        @result = rs.first.mail if rs
      else
        rs = client.search(base: @domain, filter: "(cn=#{name})")
        @result = rs.first.mail if rs
      end
    ensure
      server.stop
    end
    render :cwe90
  end

  # This server does not support complicated queries, such as
  # wildcards and &, | expressions.
  def setup_ldap_server
    server = FakeLDAP::Server.new(port: 1389)
    server.run_tcpserver

    @domain                 = 'dc=example,dc=com'
    @toplevel_user_dn       = "cn=toplevel_user,cn=TOPLEVEL,#{@domain}"
    @toplevel_user_password = 'toplevel_password'

    @regular_user_cn        = 'regular_user'
    @regular_user_dn        = "cn=#{@regular_user_cn},ou=USERS,#{@domain}"
    @regular_user_password  = 'regular_password'
    @regular_user_email     = "#{@regular_user_cn}@example.com"

    server.add_user(@toplevel_user_dn, @toplevel_user_password)
    server.add_user(@regular_user_dn, @regular_user_password,
                    @regular_user_email)
    server
  end
end
