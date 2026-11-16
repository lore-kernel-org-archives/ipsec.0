Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851154;
	b=xURfRP+K3buneN3OSlUJSyJVlll5cSIyGvhj9qanldrxeid+KOZtLV42VsU8Cgpf06F4
	 Knlm/VC61zWrlcse4cW7/9k6TZiiVMOwaJWeKSMSO+8W9lgWw+v4dK48/y4DG5yvNMEyt
	 cD25c9BpADLk6GogPpm32CJHZh0NK6c9YJxInnmI1tHWlVKfQmsAcR5foYGPKyFS4nhoH
	 hE3upDxYFqmDmXDkYbrK4yztVn8HPBOfj9oUadGMucEUTr1BcNE/uiPuGe4kkKD6Xm5JB
	 1wZS6CO0Edsm46DoIm+h/lcP5zpdXA02ta55pS67UNtiqC1fepOLgw3Ys5wEjhxj3yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
	b=DOEcYQsS6+10DBPf4sLXq4umWfPik373XedTj5QJHibTx0X/wQzLuAUQZtMcDZGzU/EF
	 rMIuuuZnfIozNqkPwnOgVrhAiXuQ+CttH0kwc41hPgK3eKgrxtssZyOWPhetDcg9G1NSR
	 0RtUcgB1i3H1DonvMd18Sjqplr6vRRtpsz9ksKwuV+mVDMcoY6g/U95FNNQhzzTAHOIkl
	 mfPwpdwF9GYQyLUl0fALxUVZIYsAKRvgds+TS+YBDcP4k1qJsDc+n9TDjz78mzg4EwG4E
	 GiK0N/S8ULol3VKqQIm+ZXaoOJk3Wd9k73vW8vo5PtvIx3u3gfhipgwWrXiRDIjYolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=K1noAZ51;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89BB606A323
	for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 17:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=K1noAZ51
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efd432714aso2352515ad.0
        for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794851153; x=1795455953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=K1noAZ51a9FfKFT2BHtamTWX6ZF3RWEDVjWyLhPvIi3w5AARrKS3xZhJQxtV5Fv8kR
         z07Un6/NWnhPSymExDYhipVk3X9lZFjTz2e/2MJ4U7gd5ijPztcdDBMgEtXlRBZmR5uQ
         NW5Gdr5Hh/U5KOf06N7JJuQK+NiyYnqXrKgoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851153; x=1795455953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=hK9Ls7/J5UMAD03BBEaBmanuGdbe9gXO/CEwh6zVQAsFYKbyOe1PaHuOvf1r2k4jsI
         xF6s1AT41wAkW9UyTD4d6jaWzGX69i8Dbny2J1qtuSD8ThRbBD65io8MF0NxNZr021xb
         dLL++gCMaOOQcAYLGm2+XmYbNcPCVZ9/ujPCrsD4++8c3Esc4q1JM1UHlhfDlVkK9NCS
         Brpm/Lw3cGQ34m/rsLKYjRLBhzo2UdziHvt+wrGavgh7gPO1Vrz75Yd4mydpEcEOC1yh
         WwXQUGEvwOq++t+vrcW/ItIwt5D7MySWjk5hKT/bWTf0Q3+cib4PxmLpe3GrmOFYEek4
         ZMIQ==
X-Forwarded-Encrypted: i=1; AL+hErHwI5XbsPcqmA9RHXV99mTsI4Rb32tv2aziBJXXj5/irdE2UfYeDOX5kw1e+XZ4z3twrNkDcQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/L+bu83k9Db+1xy1/I9LAsHlP3cQRpCDUOzq5xUTaNCDjnqbcX
	8s4arIsEYTOdZrKZi5rSSTNMdz3nbmMmYYBjQR7MnUrqV4QZn+E4/cANztAlNwSki+k=
X-Gm-Gg: AZFdTZeSgt6CHXIrr/81E+9gsUC/JIQnVXOjCNTxFIPfnyzCZ8VAqacBa0TCfJLU76y
	jrnahLJpuK7VTVVVmfC6EBc5BUBQ761x6fiTjS/6g+Qpt266KVRkHZvAkBLgm4pj9SRMPRCf1OG
	z+CNOzLpDpYhkPakyAWF0uFuR/7gkmKuoxJywI10kTXqt+0hUXNbglTuJ2CG3J2UZNp28QXNVVN
	cpmtwJQ7V5xe7J0ww5VT7+c+KLxr2MKsrUqlVdMAUlxCESjeSp4omMdUHFf9qJQ2olLWhoe+A2o
	XbYEVDEt9nYbwf5vs+83ema63bU8Nf04+w4G+13HykKKPF8a2L9MeRAN49I6b0ytPhvtEhA8WuT
	RCtI7ix72iyBD3vQlAQjq/eNZGJQHQyd3Kf2QtQZ03ZR+9v5bhFqwCHNRXqm+9lZ9prS36ffXSD
	1QgDc0bb80bEa+9Bx9RGzE7ITbL5zg+UYXqdNDNskFOQcrCrFKgpc4n8H2pI/jGqlrBDmbhL4Qe
	E4Zu3kxHvx9VmeiRwXRn7xTb1riawwp8DSdVoMdw81h1PXcIGWYXNsFSdjoMjSGbv0GeMKB3vnk
	MW/DtNBk5mokKHFsJp74uKgc8Fw4FivfTEDCQMiMTx8UqWbRXqljmwOBfP/5kiYAUqW0mnhJtb0
	RbCZntpyXXq5r9gyMLQcqV6W1bo22hYzdtiYSG+AChpPAtFNhrDe3jw5xH6OIvPD+
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr106958285ad.22.1794851148382;
        Mon, 16 Nov 2026 09:45:48 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7ab901dsm2577055ad.74.2026.11.16.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:45:47 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH] xfrm: do not write the ethernet header when the mac header is unset
Date: Mon, 16 Nov 2026 23:15:31 +0530
Message-Id: <20261116174531.2540348-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174531.2540348-1-piyus@iiitd.ac.in>
References: <20261116174531.2540348-1-piyus@iiitd.ac.in>
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

xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
mac header after removing the tunnel header and then stamp the protocol
into it:

	skb_reset_network_header(skb);
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

skb_mac_header_rebuild() does nothing at all when the mac header was
never set:

	static inline void skb_mac_header_rebuild(struct sk_buff *skb)
	{
		if (skb_mac_header_was_set(skb)) {
			...
		}
	}

and it does not clear skb->mac_len either, so on an skb whose mac header
has been unset while mac_len stayed behind, the guard is true and the
store goes through an unset header.  skb_mac_header() is
skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
bytes past skb->head: a two-byte out-of-bounds write landing far outside
the skb, in whatever object happens to be there.

skb_unset_mac_header() leaves skb->mac_len alone, and of its callers only
skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
(SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
VRF device can rebuild it, and leaves mac_len at the value the original
ethernet frame had, which is how an skb in this state reaches xfrm input:

  tun_get_user -> netif_receive_skb -> lwtunnel_input
    -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
    -> skb_unset_mac_header (mac_len stays 14)
    -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
    -> xfrm_input -> xfrm4_remove_tunnel_encap

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
  ...
  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56

The address does not depend on mac_len - it is always
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
sentinel is what mac_header holds - and mac_len only decides whether the
write happens.  The value is skb->protocol.  It is two bytes at a fixed
64KB offset, crossing into an unrelated slab cache.

Only write the ethernet header when there is one.  This mirrors what
xfrm4_transport_input() already does, where the header length is taken as
skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and it leaves
the behaviour of every well-formed skb unchanged.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

Tested at runtime on mainline itself, before and after.  Both kernels were
built from aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
CONFIG_NET_VRF, so each image is provably from its own commit.  Six boots
each, injecting after the uptime passed 130s.

The skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the
control: they fire when the unset-header skb reaches the receive path, and
this patch does not touch that site.

                  skb came through   reached the write   KASAN
  unpatched         5 of 6 boots       5 of 5             1
  patched           2 of 6 boots       0 of 2             0

Every unpatched boot in which the skb arrived reached the write; no patched
boot did, including the two in which the control shows the same skb
arriving.  The assertion inside skb_mac_header() disappears from the patched
runs for the reason the change implies - eth_hdr(skb) is no longer evaluated
when the header is unset, so skb_mac_header() is not called at that site -
while the unrelated warnings remain.

checkpatch reports one thing, the missing Fixes: tag.  Neither tree we
reproduced on carries history for the file, so we could not determine the
introducing commit; we will add the tag if you can name it.

 net/xfrm/xfrm_input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..624ff8055 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
@@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
-- 
2.34.1

