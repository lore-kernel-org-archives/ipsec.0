Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798120;
	b=OAwKY4grRY2DWAXRCFM28hAucZsSH1r0zErynmCKxBbmJ9i7GliMKHS/C0Y1JGhQIEDY
	 1MUfAKzFlGEgQvXuTjDFY/8R6RTdBTMUeVhLJjAAqIBRKEBR0FiSwquoOqj/WAWWUIgPH
	 IHGvZGPdiRWn1TLKKoxWnqctgueUcvxicii+ttiHjVW03aDUKXeqZlr0V2F6nUdwnsVB7
	 aQWIICbw2s5cnx3a+AeT6I2MwZbN7wAP9BQ+iUY3i+1nJe9X39vBPiTxOAJMStLmLclb6
	 xMwXZFjZpFyG4UpN/jRPLDaaXztOV2a6xNqXlC0etN4aqWR5AaRfVpGbjXAwAVDa7oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798120;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=H5PJwaF+JX9HNNgDeTEv6/PetwW34s2zOXNWJoIQFbo=;
	b=lgFwVBJ+ye7RdA7yB8TRwybHQpMIPcV6efQyIKGPR5WFdjSlcHwutzykzN866Mn6Lk6S
	 lg0PnHscqUUIBhf4UfcxnTwcsGBls6G7d4xFGX55EmLcYdXVfNlijlracOymrgiQUtrnN
	 Ijm7ptoDiM+C9BJYuaslAYTuX3ph1p4vGQT21vH7WWVBVn1xFS0o0B1QFKC0N64K+rsJe
	 cp1Z5t04Z1GkPlCx0rERSlbV9aq3pgmSuWyWYJunFlpn18qn8m/O6CJcDx+YgPDHSw8fb
	 A9WsRt5etHTMwCcpsXGd5WjbTlg8xM7llQJLuN/cFXKMpB+dU+zUQt3PLzLM3GSNVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=BQxYEdgu;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A365606A31E
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A365606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=BQxYEdgu
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jbfW56xMjzNknP;
	Fri, 27 Nov 2026 17:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795798114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H5PJwaF+JX9HNNgDeTEv6/PetwW34s2zOXNWJoIQFbo=;
	b=BQxYEdgudhiizquByfte/Ved9VDZgS67PkwaiI3yMqDYmFrAfCOyzie65gur2bp54VotqU
	+qj07O9Y6W37qKrMOcuIZ2pGqwPFjL0bNESmP+KgkLd9plBaaSLr9OY382xX0EZu05swyc
	vAWIFuv4htVtACpcLhEoAsWc3gSc1D1sKzndiIYck4FM6Q015IIVJsqsO4eZxtP9qNEwBW
	4OydYJTMmtkocs0t9+KlXLNGX1CAABtfCFVzZb7Outp96ORoQMMUILxvhpAEdRJi5Ulac2
	lgT55EBwEDtqjRWuJNopV0qOUBXVuwL6GzO/5Pa8MSthsmfoBrWN8eR9ZWiakA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 0/2] xfrm: advance the route generation when policies are removed
Date: Fri, 27 Nov 2026 17:48:19 +0100
Message-ID: <cover.1795797791.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jbfW56xMjzNknP

Hi,

Deleting, flushing or expiring an xfrm policy does not advance the IPv4
and IPv6 route generations, so a socket that cached a plain route while
an allow policy matched its flow keeps sending in plaintext after that
policy is removed, although a policy requiring IPsec now matches.

This was triggered at runtime in a VM test setup (not observed in
production): a connected UDP socket keeps sending unencrypted datagrams
after the allow policy that exempted its flow is deleted, deleted by
index or expires, and keeps sending after a flush with the output
default set to block. Patch 2 adds that reproducer as a selftest, which
fails in all these cases without patch 1, for both IPv4 and IPv6.

Thanks,

Ralf Lici
Mandelbit Srl

---
Changes since v1 https://lore.kernel.org/netdev/20261126111516.317545-1-ralf@mandelbit.com/
- Add a selftest. (Nicolas)
- Cc ipsec@lists.linux.dev.

Ralf Lici (2):
  xfrm: advance the route generation when policies are removed
  selftests: net: add a test for xfrm policy removal

 net/xfrm/xfrm_policy.c                        |  34 ++-
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/xfrm_policy_removal.sh      | 212 ++++++++++++++++++
 4 files changed, 238 insertions(+), 10 deletions(-)
 create mode 100755 tools/testing/selftests/net/xfrm_policy_removal.sh


base-commit: 1213df0bc5993e479706c5eba5830243d778f164
-- 
2.56.0

