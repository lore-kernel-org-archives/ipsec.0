Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963297;
	b=ltEASs+QgeMrrAS79Jjy3iOjKxKd7wLOZ/1c/nuIrAnXq5OSNCGI0LPNi0Fpkxiq7nAV
	 E2Zn5SodXPrxn6nsqiFgAAZn2mAjKpmxJbn6T6HvJ+w0l9fhu176VCnsdKhD6lnvJDi9O
	 EMspgRD6SQZgSWwCB3H2ngxSausZ36jLYjSLOy/sebYqUXA5m/lkwr3UP0F9ySWQqbwwk
	 Y1aWuWYu3XxH2z0Z0b5WWw/Nh5AM41veY5sNyL6gidUwwqAe0H/PEG36Tu78Nn5llYvxl
	 V02FA0TrbLPZ0zHSfrQ0RTdyFOuq6k889G1uhfFUgyo1+0yRixgrOq7ozvIbgcodAYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
	b=wZHaRy622PU4geUuofSL0FaUYx5IsXHfkbdonYbYxN9Aoh+AMQPM7O/kb3/IGeI6beh5
	 AUI5l+gofXhye8uF49zI4igjX6UYeZOZsAIF0T+qhPDe7T/y11otCnM8a/TRUrvrMMlxi
	 iepQPsRUaGvWDFcLiKRrX5siW+hbjM4zBoAjh4aTsqY/ssE8c3ryl/0WS6RgiJyN7KZlt
	 dHhj3DUhRNObuFL/srVItgCduyBriV1t5lvuLSFtMf+mGSyEurGQbLNBYR8dpPeaocc5o
	 3GXxJ8WTokItOOo8YUNiA9p24vo9uRmPG5i+rfvP3fpDSmVmien34lC8BhVZ6XxZ85A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=B2rX2kcT;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BE606A894
	for <ipsec@lists.linux.dev>; Wed, 18 Nov 2026 00:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1BE606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=B2rX2kcT
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so237864a12.1
        for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 16:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1794963297; x=1795568097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
        b=B2rX2kcT2ZTEqrea19eMAWoWcKlDGtM0IT3gBOEdFu/vyQOIphApisoaVlaIICv1T3
         aTqHM1Ujpab51pmBuKj1ue1WrkwxBZfWmfVyEXRW2C4nAEfML38Gr4ye7oo6RB+ZTzjT
         5jefdN+pXpBfHT7UiZYOdjpkHHcpfhjC2FBZoZTlONJa9bmNgi7aHKbBJWzPxRhS6M0w
         MSMNOJLl8SwZ4IhGR3kDNkUqLWFSLIRcnskqRfkU5lHxKaGoOgaSOFmXL1s2LyMzHGnv
         RB2QAmLKv2NEuqKjZR4a5idyfegiusfb7lSMwI5SeQWg4J7u8xk3sHTB1T4KQWNS3KYM
         iaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963297; x=1795568097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okrriRKI5iUmexz73yDJ3a18AbZwO0cF4iXDn3kRazQ=;
        b=EjP9JFAdEBVh1pyo95069rPOZmy/JBoN0KwWleK4TBykGdd4u/ur3S2zVvhkStFb77
         V7xg7b1BF7YWIMD9yV1urFVZRQjWyXupnnxYzXocs4xkMyKXXhuBN1kKEckJkZkMIxRb
         GpYIa39WiLLYy0/0o01yV6zNJCCIPNyEgrCcXfrXTbRDj3J6g8IMV/0/GTa/pTReoC9N
         gBjaWSZaWhX+N5rPHkxHIKR8m481+cP78c3/NNuTo7dvbOog4HFxwLYkLM0drr5BkG+i
         k52NWZ47oOn69YDJWDmQCQQH3Xhni33TjfSKIsS9awcg0TPLW9jpmOw34MeymiD6kXXk
         qwdQ==
X-Forwarded-Encrypted: i=1; AL+hErG6uAfbg0lrvb2Isuq9tBiPAd52khFzJxTzlKxGPuFhw9TIHdPSP7JIH4M5mORtiUthn+oSJg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/m1YJsKSHOg4VPveGvGKwAYRYWb76TQCKiASpLMB/30QLWD7L8
	ug4pyFz0F+Pm/G7NdhsZ5qe44JZB2s8effaNfyjoKGFbxNCFZ9zl0yK/FW9Qp0zZeLv/AXbh719
	ymJV1F9jidSN3PzhINkpnEFks3yzozlWYUyooBDq2iH1XLZpRha0g
X-Gm-Gg: AZFdTZf0DZxTAhR9A698bHe3jN5EjK8/lANXnthxS4zYK6UgigJlCpO5K1Wp3t2KKtR
	armwDP/q/ln9hmoS6cnxAJyddAuxM8gJ4HV3gknefnXdSUdAVeXBr5dPhiQN5iqM3hfXpzbHSI9
	QhHcO542z0xH7zuHcJvgMa9ZDDrv0hVHDLaZ9Z38Uf46wzFhsMLA5r7bK2QGzX46T+JVUtZ4g/Q
	sY5SN0+mKWLmNYTL8k4oDdpj4VI6FmB8ZAVYqD2fR4x97lRCrNos5xDxyyTkOejhDz+gzTjUJ82
	Lpplar70ASnhzyDy8iKa0jB9jfmlPrb/LbRTeEGXZGID9zkdRGCha28zkDS1yASFEOJz+DuPcDD
	3NxqkZJTuaYAPyQJww+DLBpG49EY=
X-Received: by 2002:a17:90b:39a3:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b3d07a29camr946463a91.38.1794963296708;
        Tue, 17 Nov 2026 16:54:56 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm161524a91.2.2026.11.17.16.54.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:54:56 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec 2/2] xfrm: iptfs: hold the dst while a packet waits on the output queue
Date: Tue, 17 Nov 2026 16:54:49 -0800
Message-ID: <45f802a2-c639-44bd-aba0-5c81e2198c9e@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
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

iptfs_output_collect() queues the skb on xtfs->queue for the delay
timer without taking a reference on its dst. Locally generated TCP
attaches the socket's cached route with skb_dst_set_noref(), which is
valid only inside the RCU read-side critical section of the transmit
path. The skb outlives that section on the queue. When TCP drops the
cached route, as it does from the retransmit timer, RCU frees the dst
while the skb still points to it. iptfs_output_queued() then reads the
freed dst, first in iptfs_get_cur_pmtu() and then in xfrm_output():

  BUG: KASAN: slab-use-after-free in iptfs_delay_timer+0x2ef/0x1900
  Read of size 4 at addr ffff888100cff01c by task swapper/1/0
  CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.4.0-rc3 #1
  Call Trace:
   <IRQ>
   iptfs_delay_timer+0x2ef/0x1900
   __hrtimer_run_queues+0x16d/0x340
   hrtimer_run_softirq+0x136/0x210
   handle_softirqs+0x162/0x420
  Allocated by task 0:
   dst_alloc+0x4f/0x250
   xfrm_bundle_create+0x236/0x1010
   xfrm_resolve_and_create_bundle+0x13c/0x1d0
   xfrm_lookup_with_ifid+0x303/0xe20
   xfrm_lookup_route+0x1c/0xf0
   ip_route_output_flow+0x15b/0x170
   inet_sk_rebuild_header+0x4c0/0xa40
   __tcp_retransmit_skb+0xe8/0xda0
  Freed by task 0:
   dst_destroy+0xe8/0x140
   rcu_core+0x3f6/0xea0
  The buggy address belongs to the object at ffff888100cfef00
   which belongs to the cache xfrm_dst of size 296

A NULL pointer dereference in xfrm_output_resume() follows the
reports.

Take the reference with skb_dst_force() in iptfs_output_collect(),
before the skb is queued. If the dst is already being destroyed, drop
the packet and count XfrmOutError. xfrm_output_one() takes the same
reference before it calls the type output handler; with IP-TFS the skb
leaves the RCU section earlier, at the queue.

KASAN reported this while the panic fixed by the previous patch was
being reproduced, on an unmodified v7.4-rc3 and without fault
injection. In the setup described there, KASAN reported the
use-after-free in most boots of the unpatched kernel and in no boot
with the series. Kernel selftests were not run; none of them covers
IP-TFS.

The analysis and the patch were produced with an AI coding assistant
and reviewed by the submitter.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
 net/xfrm/xfrm_iptfs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 95ba73013..f5260bc51 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1914,6 +1914,20 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 			continue;
 		}
 
+		/* The skb will wait on xtfs->queue until the delay timer fires,
+		 * and iptfs_output_queued() -> xfrm_output() then dereferences
+		 * its dst. skb_dst() can be a no-ref dst (e.g. the bundle built
+		 * for a TCP retransmission) that RCU frees while the skb is
+		 * queued, so pin it before queuing; if it is already being
+		 * destroyed, drop the packet rather than queue a dangling
+		 * pointer.
+		 */
+		if (unlikely(!skb_dst_force(skb))) {
+			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			kfree_skb_reason(skb, SKB_DROP_REASON_NOT_SPECIFIED);
+			continue;
+		}
+
 		/* Enqueue to send in tunnel */
 		ok = iptfs_enqueue(xtfs, skb);
 		if (!ok)
-- 
2.53.0

