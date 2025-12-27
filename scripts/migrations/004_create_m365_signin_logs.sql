CREATE TABLE m365_signin_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  account_id UUID REFERENCES m365_accounts(id) ON DELETE SET NULL,
  event_time TIMESTAMP WITH TIME ZONE NOT NULL,
  success BOOLEAN,
  ip_address TEXT,
  location TEXT,
  raw_json JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
CREATE INDEX idx_signin_tenant_time ON m365_signin_logs(tenant_id, event_time DESC);
CREATE INDEX idx_signin_account_time ON m365_signin_logs(account_id, event_time DESC);
