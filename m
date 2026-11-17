Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926188;
	b=qQCVknWph33DAWbVHx72mwHhSF0RzjREu4OiRxFiU+pOTyzS2OkayxUehY4GmopNK1hJ
	 RpXE87Kq93eFxDduLpQLjrJ+DCOezBmY1WNW65CdJg5/DXi2uF4nBkJ79SRX10dz+rOBh
	 5aJmpBVO31EeJbUSzL7cpFZqAqlve+OXGnkeAeljVW25SaGMqEn7SABgzK15opHBZXxP9
	 GvOWRif5GaXYRST3joSwWD3DezukvfVL8EErYR8EugRF0LtwE3R4SBd78HoCisHXWR0cz
	 yRpq8X8ZO+DIXb6+buOR1Ojuoq1QBjYucodAkh/NtMMO4ktMpl067Fgrr/D2WWP5/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
	b=LoNSSZtK8LjCAnueyRuJN74edbmq3488kq3/0jHIFkpKwHihVDS1K4VoAxkL+WOp7dLW
	 wK6C6iR2OCPP3QvEkVArMKsQxRIblhyDX7vLMyluyHG6mj42RTUl4PwjSgxx6j7OUdn4y
	 OsgXDd3BRCmyOrw8KD0Zo9GWlYMgmqOG2yQY57eptHVq6rW4f4GzBeC0s81XoJfgSSbga
	 /sIKpiVUQL/baxwOL+FyKNNGGUA5a9eZ+waUE0a5mtz+xT7KeKSp8oeqDO3jv2bSxYrnU
	 ifyVrJqq1hHWm1jVqsASFk07XrI/Xw3lbq4hRJWm4LfB5HnQkkoP/oysqwcqfdpZaaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=a9yMoPyL;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D1606ABA3
	for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 14:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7D1606ABA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=a9yMoPyL
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2535843a91.0
        for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794926185; x=1795530985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=a9yMoPyLd5TWXN/7G4lWPJ18uXvBBD4vv+YU2D/98VcDPsnHeAzxLed0oxk+Hf7p41
         g0YYpCDXI5b04aZt5ZuJVyzocjR/DkCLoFt69dP9FuzslyTz0YIx2NVH3TuSDM3+/JjP
         bOmvGNFEwczc92Gs+w3LK6UxLgd5c5r7VkMHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926185; x=1795530985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=UWW59d1zUVs0HIYilOnBZKOOm1Ade0KuzN8GWvYDPFXmwbbF2qOvlOKPEe+lZIui+5
         lO1n4IJhjo3oOAIG1QdXoMybfaPqHwixYde7lQ47Vz82spcec5GYnZHASvxJ2Pdt5dla
         9CROm1vJX/pSHNeMVDtj4Cx9A9DcpJaW+X0BLJF4J2JMX//6b0lisFCm4ZuKiejaNNkp
         /rA3/6QE0U72uJ3ZEwSyDav3HUoaG3XaFSfeVvqzM73tDsk18+CdwWv9MN30Y8GYZBJm
         echGdh8pZxSud4uSjBpfUTuXyMFRsE/MbbbBj/HZCJ2sQyXwVVDQ1a3QQI3YOpUHEx2w
         woSw==
X-Forwarded-Encrypted: i=1; AL+hErHoMW1Fg/fR7D0btRk0YppTae32vcHo1dHcD/juOWqh3ANXS8XM5IQq7CPKnvbmecdfNlkS2A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QFq1md2wB24fjm40IXn3ShyxkOxbuTTQqrwQWvBisiKWbfCui
	AFBK5KEdnAe/omNlLlZje6Wt5AwsV9D3TFfxBbxTDdvPs+i8/cdtBGNsW+IXqzkxwhI=
X-Gm-Gg: AZFdTZckN3mbOupEoujv31mCr0b7GeQ67046mkRU4RA55kQzdzQoqpajalBgopi2u92
	eCZF2+rpbIIHJknsi0AtqJgwMkowF1mAo4AXJWnBVbLajferWd0A8mj5jc2Dc0kMT5lQaegekRS
	lVFK5cHdNORySyAwPcdpIxUI21Kk1TE21jjkkC9UZtgd9Fc0sl7R+IvqrgUxOD5/lahiaRqDuHl
	ol/uqIWS+V/wA8OFLl1lrS/1P75Crn7ZUYWELipjPLepXYho2O3zyz33u2+oowMPdFzsjAQ8rcz
	PyWAh2qvo9EQOhfKHx88yc2KC6z+GTlPjCxLNRsdGYgeW5WqsddURQfk+idNfA5b7pTMRWzfhJw
	0IISsgnrvOPEF0fcNDtNdrULKOprapZxj3V/VEvgTi4+m7tyzohTs+ClGrGgIOFeuQiShtULsRf
	Uw/Hh4Zy2rE+t9SMJCEXeSo5w2X9EG7Hh3/fyT5rO9TB8Ar9x7NioopUqtB4PuHs8XwJTf3RvmE
	FHtc1b/C9WJHAIBFNOb/oWRjnPYKq9mhXi8YGcdwLb6sJanyZ9+2qc/h/5orxG13xxSVlcxMcl6
	74Ue9fKzwRqdzcvcC0Y0mXsByfPgzPBs0pmHZDHznVMQkqaevki6SF0NpP60uZ3BSPsn0KBZp14
	9CtSO62Ehp41Z4pCuanJa9LSvBu7Olt2J2tJylPVG/n01ltg4392eMwAxVbT8IyIh
X-Received: by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b1b07e9b1amr13858047a91.3.1794926185112;
        Tue, 17 Nov 2026 06:36:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm4414174a91.12.2026.11.17.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:36:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v3] net: clear skb->mac_len in skb_unset_mac_header()
Date: Tue, 17 Nov 2026 20:06:12 +0530
Message-Id: <20261117143612.95112-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

From: Eric Dumazet <edumazet@kernel.org>

skb_unset_mac_header() marks the mac header as unset but leaves
skb->mac_len alone, so an skb can end up with no mac header and a
non-zero mac_len. Code that uses mac_len to decide whether a mac
header is present is then misled.

end_dt_vrf_rcv() (SRv6 End.DT4/End.DT6) unsets the mac header of the
decapsulated packet so that the VRF device can rebuild it. The VRF
device only does so when a packet sniffer is attached, so without one
the skb continues up the stack with mac_len == 14. In
xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap(),
skb_mac_header_rebuild() is a no-op for such an skb, and the following

        if (skb->mac_len)
                eth_hdr(skb)->h_proto = skb->protocol;

writes two bytes at skb->head + 0xffff + offsetof(struct ethhdr, h_proto):

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
   xfrm4_remove_tunnel_encap
   xfrm_input
   xfrm4_esp_rcv
   ip_protocol_deliver_rcu
   ip_local_deliver_finish
   seg6_local_input_core
   lwtunnel_input
   __netif_receive_skb
   netif_receive_skb
   tun_rx_batched
   tun_get_user

__input_process_payload() in net/xfrm/xfrm_iptfs.c has the same three
lines and reported as a use-after-free rather than an out-of-bounds. The
address written is fixed relative to skb->head, so what it lands in is
whatever the allocator placed sixteen pages past the skb: a live object
gives slab-out-of-bounds, a freed one or a page back on the buddy free
list gives use-after-free, and a different live object gives no report at
all. Clearing mac_len at the source makes the guard false at all three
sites.

Clear mac_len in skb_unset_mac_header() so that all callers leave the
skb in a consistent state, and remove the now redundant assignment in
skb_carve_reset_headers(). The other callers are on egress paths
(__bpf_redirect_neigh(), bpf_lwt_push_ip_encap()) or only reach the
helper when the mac header was already unset (bpf_update_srh_state()),
and do not read mac_len afterwards. vrf_prepare_mac_header(), the rebuild
end_dt_vrf_rcv() unsets the header for, pushes ETH_HLEN and then calls
skb_reset_mac_header() and skb_reset_mac_len(), so it recomputes mac_len
itself and never reads the stale value.

The issue was reported on the list by Piyus Kedia and Kapil Vaswani,
who found it by fuzzing with AI assistance and reproduced the KASAN
splat on v7.4-rc3. Their reproducer was not published.

Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Reported-by: Kapil Vaswani <kapil@presceralabs.ai>
Closes: https://lore.kernel.org/netdev/20261116174531.2540348-2-piyus@iiitd.ac.in/
Suggested-by: Kapil Vaswani <kapil@presceralabs.ai>
Suggested-by: Piyus Kedia <piyus@iiitd.ac.in>
Tested-by: Piyus Kedia <piyus@iiitd.ac.in>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v3: use the generic fix Eric suggested - clear mac_len where it is left
    stale, instead of guarding each place that reads it. v1 and v2 added a
    skb_mac_header_was_set() test at each reader. Authorship is Eric's.

v1: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in

 include/linux/skbuff.h | 1 +
 net/core/skbuff.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..9cd8eff0309c 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3186,6 +3186,7 @@ static inline u32 skb_mac_header_len(const struct sk_buff *skb)
 static inline void skb_unset_mac_header(struct sk_buff *skb)
 {
 	skb->mac_header = (typeof(skb->mac_header))~0U;
+	skb->mac_len = 0;
 }
 
 static inline void skb_reset_mac_header(struct sk_buff *skb)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..8fe0938d6131 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6984,7 +6984,6 @@ static void skb_carve_reset_headers(struct sk_buff *skb)
 	skb_unset_mac_header(skb);
 	skb_unset_transport_header(skb);
 	skb_reset_network_header(skb);
-	skb->mac_len = 0;
 
 	/* Inner offsets have no "unset" marker, zero them so that
 	 * skb_inner_network_header_was_set() becomes false and no
