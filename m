Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285626;
	b=KhgYxUn+m9Ykr+wHtMniYD94246nRK/NRCuxkIjVBPIlf+LIV35x5tPL4shJNwdFrRmV
	 dfgys8oE1DJaoHq/rzZWFT1eTRQ7aOs8LHzJLXQtEUF1AwnZJVOgHNw/2KGo2js8b4S4K
	 O+TFlCoFYuWrLYvLmLovZx80IT0QcROpvgN1mvDaQLwydag7iYCW4mxlHuxbZkgnxWq0y
	 3/3DOVBFwG8uP6MfLtsIzDcADyTRNb73bRq3M00Jkxgy0RwbpWPZPOXMBqooXGZYI7t6/
	 VIvr/6Slzyp/efpZAqzUmFkhSL361Pd+iNMtHm/SAWEznqta5tzDBZ39UACrOll8aEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=afBLPxnTKw6hTyvfGk2Nqd/UU7dMRfr50ALLZwezHG0=;
	b=cZt2MPsrEq/mkaVHzfU51JSDytzvbcgWmXwLpFZP18GvoaUa/+G1KELXnnJZHaU91ccw
	 MfPdioa1TScafWzfPXumh5FmM1055bo/jQr22kA/Pndfpl7/qxIoKv2ycAToxoJszDoon
	 pxzm7DQmKIaUo7JPad2TgMpirgjrCsUiQ/GQbTBZTC+M9NSw30w9eT8I9WTatk5iUgzHQ
	 PbqX9t+RjsInAA7geeoDtcxzwr7K7/zlppIsu3MzvZX1eLe/3ThOdcFcESjSwE9XfZYyK
	 6lsarGfZ9350bSDbhuzz6uk2zoqZYuYoTgXlcAWVspHX2szCwpi5HRZQcscJN5DZqqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=voxMxHc8;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56B606A687
	for <ipsec@lists.linux.dev>; Sat, 21 Nov 2026 18:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A56B606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=voxMxHc8
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso467199866b.1
        for <ipsec@lists.linux.dev>; Sat, 21 Nov 2026 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795285624; x=1795890424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afBLPxnTKw6hTyvfGk2Nqd/UU7dMRfr50ALLZwezHG0=;
        b=voxMxHc874qDI32a4cabW8uDoXjcNustD4rSzjfgLYdqyuGBYyF7lCcQ593D52Wjpy
         BxATGgUjolQxuGj9P4ITvnAFQcR+XlU71aD4YkBEmMuFE8+o6/gOtmg91i7b+EnPV/9o
         JQRDdyeMKRD6G/m+UaahN091xVu3irmCSoKKKR0m/Zfq/24I7f3SJjuMyU/5srYLL4vc
         r0rbLT9E0/Sa6nSMYI7/C2Gy3UOJKS+bQOY7U5YP3AyTCPzAEHZ2YRv/DOb75Y2zxURx
         j3b02R4WqMzmDdpsBF610P9/NV//Fpf7//6dKhFZHYDttTjqKZQbCmUFyH47mDY8rPON
         dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285624; x=1795890424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afBLPxnTKw6hTyvfGk2Nqd/UU7dMRfr50ALLZwezHG0=;
        b=HPAYjEXcrpKKInpEQz39p3rb7rkzXQ9QtSKkZ3fM8SJtLYj2r6X93kGrj4EIwtrXTE
         FArMmHehSOsRUqV5UChGU8uUghDh0s9wpBZfOmU++wPwmNEeZJls0hgC/8696uGEYMzp
         gCEE5a23mpRt9IcE/vOtHnAyD4tVI9BD6x6RbwwXqgVHf05k93sLmDyIHrASO2qdtKx3
         B4Whjl27saVeo4wkGny3MlnaM177M9PhwFb94ml+fM/4oQsNFC/zADmgX6IlI4bkE31l
         oMg9lNgyrRZxMc3lBsnRpAd3F27+GcpH4EYNUqqzJ8wsM6zkE5uOWThpsRCAY2699YP1
         ceWw==
X-Forwarded-Encrypted: i=1; AL+hErH+GJwGEGrGjmDD6jzlcfum8OSN4+Z8C/baA6yDoGePUPqNxqGJqnmiWY9wy5KMq/Q9nhjxug==@lists.linux.dev
X-Gm-Message-State: APuU4Z8SZBUpZfJSof+H7/CD9R5T1uDE2x457175tNJswMYMHGWePjOY
	cdm9ss3aBsIohfWDxYP1mdo+Reb4R/5jzLo/KA4wwgTnUPepppyzHZLq1tI7FBFjgw==
X-Gm-Gg: AZFdTZc+1rqZdS/mIw6n0z4F8YpaqDJUnEtGUd2KFcbV+lWvcec8ZLSAGAs0jUGRaX1
	KuElkJVkq2/tlQjwdxv7xYRvAG3LDvU3Bg24s44bsBNfxi6etDKSffTk6FOupNFYAkMUyUa/V0F
	uiEN034AN1wgYY7jyhj0h8CSeT7qfbiMeVX3U6RrA2clZiGixpHqfiKyiByCOsW5HVju6kuLEsk
	IQnUmJ9JqkwdFwur3IhqD8Z8hZEsurkvzxOOiweOwhyVq0IZq7+OU4cotbDnVlvC6J26PGgQ5nS
	iq8AyKkyv8c6GdsIqhfIV136IiyauSnP9vuZtl2x9t1NTondDPLv2uYvS3dPDku8PF3ZoM80Rbh
	KMLGBA1K/OEr7HxrBeii95q6i/FF7wCeP6bM8wev3uEn6eSMM25hAFi5RcN9mX0YleobbzpTnq6
	jj3+sso3+MCrSeLXXl7cYq9YttfpJSWF0vf2S/ct+jBl2ZHKRdbhpqypfdhWc8yDdqLeAPBS4HJ
	Y/rvPWdsRLZET5D/bGLL8W+bCyXkOMd47rC10c7DTVWRglwt8rAZkhQPKM4QWkkYURqhtWqVxgX
	x3Ljp56CM08NN4h7sjth3BOppDpa/gHOCC8q+olWV1YjxCBJZd+Gb03qOJMkNkhVpXgqabmcO8Z
	iaTIqIQbSogbhwljXCRN+Cr8Nriqz7oIIqJn4aJLRWYckr9orLNPUTBBZUxQQox+H4P2pzLwjuq
	eQp9w8FuvEux+gFlxbDOwTf+3P5OE/zkG7rpt5GqxwoibG2XoUWijkjqPUXIGCX5zGgkJCZowhJ
	aORQCamBaL2lIWZngakF76H64z30FSeOLpL/rkExIi6gySG0UVjnRCcCaKgyGFzzxAZAGjFkVb7
	ghCBin4uDMPMSIZJENTUesNfCAA/mEDfzVND7ff72TwQ0qmSlvJDF7qXW5Eaf20H8fAB+2YYkzZ
	m
X-Received: by 2002:a17:907:728d:b0:c29:4b57:503e with SMTP id a640c23a62f3a-c513a3a5327mr644785066b.1.1795285624426;
        Sat, 21 Nov 2026 10:27:04 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm224519166b.79.2026.11.21.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 21 Nov 2026 19:26:59 +0100
Message-ID: <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795284858.git.julius@bairaktaris.de>
References: <cover.1795284858.git.julius@bairaktaris.de>
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

Commit 3271f19bf7b9 ("net: gso: restore ids of outer ip headers
correctly") made SKB_GSO_TCP_FIXEDID describe the outermost IPv4 header
and added SKB_GSO_TCP_FIXEDID_INNER for the inner header of an
encapsulated packet. Every path that adds or removes a header then has to
move the flags, and none does. A TCP stream that GRO merged with fixed
IDs and that is forwarded into an IPIP tunnel, or into an ESP tunnel mode
SA with crypto offload, is segmented with one outer ID for all segments
and with incrementing inner IDs. A tunnel that decapsulates such a packet
in iptunnel_pull_offloads() leaves the state of the removed outer header
on the new outer one, and the inner header of a GRE or UDP tunnel, which
segmentation reads at encap_level 0, gets the state of the outer header.

Let SKB_GSO_TCP_FIXEDID describe the innermost IPv4 header again, as it
did before that commit, and replace SKB_GSO_TCP_FIXEDID_INNER with
SKB_GSO_TCP_FIXEDID_OUTER for the outermost header of an encapsulated
packet. Where a header is added in front of a GSO packet, in
iptunnel_handle_offloads() and in the BPF LWT encapsulation, clear the
outer flag, so that the new header gets incrementing IDs as it does on a
packet that was not encapsulated before. Clear it as well where
iptunnel_pull_offloads() and bpf_skb_net_shrink() remove the outer
header. ESP transport and BEET mode with crypto offload set
skb->encapsulation but keep the IPv4 header and its ID, so xfrm_output()
copies the inner flag to the outer one for them. Convert mlx5 and sfc,
the two drivers that use the inner flag.

Two flags cannot describe a header between the outermost and the
innermost one of a packet with three IPv4 headers: software segmentation
uses SKB_GSO_TCP_FIXEDID for it, as it used SKB_GSO_TCP_FIXEDID_INNER
before.

Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3:
- Clear SKB_GSO_TCP_FIXEDID_OUTER in iptunnel_handle_offloads() and in
  the BPF LWT encapsulation, where a header goes in front of an
  encapsulated packet (Sashiko).
- Copy the inner flag to the outer one in xfrm_output() for ESP transport
  and BEET mode with crypto offload (Sashiko).
- Name the paths that change the outer flag and the middle-header limit
  in skbuff.h, segmentation-offloads.rst and the message; list the outer
  flag in the bpf_skb_adjust_room() decap flags of the uAPI header
  (Sashiko).
- Wrap lines at 80 columns (NIPA).
v2: https://lore.kernel.org/netdev/f7d096c63c6a0b7a23a4dcea9a3de0915a48ac56.1794139176.git.julius@bairaktaris.de/

 .../networking/segmentation-offloads.rst         |  8 +++++---
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c  |  8 ++------
 drivers/net/ethernet/sfc/ef100_tx.c              | 12 +++---------
 include/linux/netdevice.h                        |  2 +-
 include/linux/skbuff.h                           | 12 +++++++++++-
 include/net/ip_tunnels.h                         |  1 +
 include/uapi/linux/bpf.h                         | 16 +++++++++-------
 net/core/filter.c                                |  1 +
 net/core/lwt_bpf.c                               |  2 ++
 net/ipv4/af_inet.c                               |  9 ++++++---
 net/ipv4/ip_tunnel_core.c                        |  2 ++
 net/ipv4/tcp_offload.c                           |  7 +++++--
 net/xfrm/xfrm_output.c                           | 10 ++++++++++
 tools/include/uapi/linux/bpf.h                   | 16 +++++++++-------
 14 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/Documentation/networking/segmentation-offloads.rst b/Documentation/networking/segmentation-offloads.rst
index 25a8b7eca847..45c1703d68b8 100644
--- a/Documentation/networking/segmentation-offloads.rst
+++ b/Documentation/networking/segmentation-offloads.rst
@@ -49,9 +49,11 @@ The default behavior is to increment the IP ID with every segment.  If the
 GSO type SKB_GSO_TCP_FIXEDID is specified then we will not increment the IP
 ID and all segments will use the same IP ID.
 
-For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the outer header.
-SKB_GSO_TCP_FIXEDID_INNER can be used to specify the same for the inner header.
-Any combination of these two GSO types is allowed.
+For encapsulated packets, SKB_GSO_TCP_FIXEDID describes the innermost header
+and SKB_GSO_TCP_FIXEDID_OUTER the outermost header. Any combination of these
+two GSO types is allowed. A header added in front of a packet gets incrementing
+IDs. A header between the outermost and the innermost one has no flag of its
+own; software segmentation uses SKB_GSO_TCP_FIXEDID for it.
 
 If a device has NETIF_F_TSO_MANGLEID set then the IP ID can be ignored when
 performing TSO and we will either increment the IP ID for all frames, or leave
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 1586cb2404c0..e47b1232130c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -1175,12 +1175,8 @@ static void mlx5e_shampo_update_ipv4_tcp_hdr(struct mlx5e_rq *rq, struct iphdr *
 	tcp->check = ~tcp_v4_check(skb->len - tcp_off, ipv4->saddr,
 				   ipv4->daddr, 0);
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4;
-	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id) {
-		bool encap = rq->hw_gro_data->fk.control.flags & FLOW_DIS_ENCAPSULATION;
-
-		skb_shinfo(skb)->gso_type |= encap ? SKB_GSO_TCP_FIXEDID_INNER :
-						     SKB_GSO_TCP_FIXEDID;
-	}
+	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id)
+		skb_shinfo(skb)->gso_type |= SKB_GSO_TCP_FIXEDID;
 
 	skb->csum_start = (unsigned char *)tcp - skb->head;
 	skb->csum_offset = offsetof(struct tcphdr, check);
diff --git a/drivers/net/ethernet/sfc/ef100_tx.c b/drivers/net/ethernet/sfc/ef100_tx.c
index 03005757c060..162cfa54f2d0 100644
--- a/drivers/net/ethernet/sfc/ef100_tx.c
+++ b/drivers/net/ethernet/sfc/ef100_tx.c
@@ -201,16 +201,10 @@ static void ef100_make_tso_desc(struct efx_nic *efx,
 	bool outer_csum;
 	u32 paylen;
 
-	if (encap) {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_INNER)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	} else {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
+		mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (!encap || (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_OUTER))
 		mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	}
 
 	if (efx->net_dev->features & NETIF_F_HW_VLAN_CTAG_TX)
 		vlan_enable = skb_vlan_tag_present(skb);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e..7ecf0f9c5f65 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5536,7 +5536,7 @@ static inline bool net_gso_ok(netdev_features_t features, int gso_type)
 {
 	netdev_features_t feature;
 
-	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_INNER))
+	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_OUTER))
 		gso_type |= __SKB_GSO_TCP_FIXEDID;
 
 	feature = ((netdev_features_t)gso_type << NETIF_F_GSO_SHIFT) & NETIF_F_GSO_MASK;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index cf6a8e64b403..0613252e7302 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -717,9 +717,19 @@ enum {
 
 	/* These indirectly map onto the same netdev feature.
 	 * If NETIF_F_TSO_MANGLEID is set it may mangle both inner and outer IDs.
+	 * SKB_GSO_TCP_FIXEDID describes the innermost IPv4 header and
+	 * SKB_GSO_TCP_FIXEDID_OUTER the outermost one. Adding a header in
+	 * iptunnel_handle_offloads() or with BPF LWT clears the outer flag, and
+	 * so does removing one in iptunnel_pull_offloads() or in
+	 * bpf_skb_adjust_room() with a BPF_F_ADJ_ROOM_DECAP_L4_* or
+	 * BPF_F_ADJ_ROOM_DECAP_IPXIP* flag. xfrm_output() sets it from the
+	 * inner flag for ESP transport and BEET mode offload, which keep the
+	 * header.
+	 * Software segmentation uses SKB_GSO_TCP_FIXEDID for any header in
+	 * between.
 	 */
 	SKB_GSO_TCP_FIXEDID = 1 << 30,
-	SKB_GSO_TCP_FIXEDID_INNER = 1 << 31,
+	SKB_GSO_TCP_FIXEDID_OUTER = 1 << 31,
 };
 
 #if BITS_PER_LONG > 32
diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c0e691..a8e1cd7021fc 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -667,6 +667,7 @@ static inline int iptunnel_pull_offloads(struct sk_buff *skb)
 			return err;
 		skb_shinfo(skb)->gso_type &= ~(NETIF_F_GSO_ENCAP_ALL >>
 					       NETIF_F_GSO_SHIFT);
+		skb_shinfo(skb)->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 	}
 
 	skb->encapsulation = 0;
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 8d7228834305..e5aae5320af9 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -3097,20 +3097,22 @@ union bpf_attr {
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_L4_GRE**:
  *		  Clear GRE tunnel GSO flags (SKB_GSO_GRE and SKB_GSO_GRE_CSUM)
- *		  when decapsulating a GRE tunnel.
+ *		  and SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a GRE tunnel.
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_L4_UDP**:
  *		  Clear UDP tunnel GSO flags (SKB_GSO_UDP_TUNNEL and
- *		  SKB_GSO_UDP_TUNNEL_CSUM) when decapsulating a UDP tunnel.
+ *		  SKB_GSO_UDP_TUNNEL_CSUM) and SKB_GSO_TCP_FIXEDID_OUTER when
+ *		  decapsulating a UDP tunnel.
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_IPXIP4**:
- *		  Clear IPIP/SIT tunnel GSO flag (SKB_GSO_IPXIP4) when decapsulating
- *		  a tunnel with an outer IPv4 header (IPv4-in-IPv4 or IPv6-in-IPv4).
+ *		  Clear IPIP/SIT tunnel GSO flag (SKB_GSO_IPXIP4) and
+ *		  SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a tunnel with an
+ *		  outer IPv4 header (IPv4-in-IPv4 or IPv6-in-IPv4).
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_IPXIP6**:
- *		  Clear IPv6 encapsulation tunnel GSO flag (SKB_GSO_IPXIP6) when
- *		  decapsulating a tunnel with an outer IPv6 header (IPv6-in-IPv6
- *		  or IPv4-in-IPv6).
+ *		  Clear IPv6 encapsulation tunnel GSO flag (SKB_GSO_IPXIP6) and
+ *		  SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a tunnel with an
+ *		  outer IPv6 header (IPv6-in-IPv6 or IPv4-in-IPv6).
  *
  *		When using the decapsulation flags above, the skb->encapsulation
  *		flag is automatically cleared if all tunnel-specific GSO flags
diff --git a/net/core/filter.c b/net/core/filter.c
index 946b07a17fce..ad73ff0f0581 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3867,6 +3867,7 @@ static int bpf_skb_net_shrink(struct sk_buff *skb, u32 off, u32 len_diff,
 		/* Clear encapsulation flag only when no tunnel GSO flags remain */
 		if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
 			     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK)) {
+			shinfo->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 			if (!(shinfo->gso_type & (SKB_GSO_UDP_TUNNEL |
 						  SKB_GSO_UDP_TUNNEL_CSUM |
 						  SKB_GSO_GRE |
diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
index 72c86ff2a847..e120272a12e3 100644
--- a/net/core/lwt_bpf.c
+++ b/net/core/lwt_bpf.c
@@ -585,6 +585,8 @@ static int handle_gso_type(struct sk_buff *skb, unsigned int gso_type,
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
 
 	gso_type |= SKB_GSO_DODGY;
+	/* The outer flag described the header below the new one. */
+	shinfo->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 	shinfo->gso_type |= gso_type;
 	skb_decrease_gso_size(shinfo, encap_len);
 	shinfo->gso_segs = 0;
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8822bae439f8..45fa88e8f40f 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1404,10 +1404,13 @@ struct sk_buff *inet_gso_segment(struct sk_buff *skb,
 
 	segs = ERR_PTR(-EPROTONOSUPPORT);
 
-	fixedid = !!(skb_shinfo(skb)->gso_type & (SKB_GSO_TCP_FIXEDID << encap));
-
-	if (!skb->encapsulation || encap)
+	if (!skb->encapsulation || encap) {
 		udpfrag = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP);
+		fixedid = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID);
+	} else {
+		fixedid = !!(skb_shinfo(skb)->gso_type &
+			     SKB_GSO_TCP_FIXEDID_OUTER);
+	}
 
 	ops = rcu_dereference(inet_offloads[proto]);
 	if (likely(ops && ops->callbacks.gso_segment)) {
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index 6c2855adff28..dbf6bbf25114 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -193,6 +193,8 @@ int iptunnel_handle_offloads(struct sk_buff *skb,
 		err = skb_header_unclone(skb, GFP_ATOMIC);
 		if (unlikely(err))
 			return err;
+		/* The outer flag described the header below the new one. */
+		skb_shinfo(skb)->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 		skb_shinfo(skb)->gso_type |= gso_type_mask;
 		return 0;
 	}
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd07c723..da0d8ba70c0c 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -459,6 +459,8 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 {
 	const u16 offset = NAPI_GRO_CB(skb)->network_offsets[skb->encapsulation];
 	const struct iphdr *iph = (struct iphdr *)(skb->data + offset);
+	const u8 fixedid = NAPI_GRO_CB(skb)->ip_fixedid;
+	const u8 encap = skb->encapsulation;
 	struct tcphdr *th = tcp_hdr(skb);
 
 	if (unlikely(NAPI_GRO_CB(skb)->is_flist)) {
@@ -473,9 +475,10 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 	th->check = ~tcp_v4_check(skb->len - thoff, iph->saddr,
 				  iph->daddr, 0);
 
-	BUILD_BUG_ON(SKB_GSO_TCP_FIXEDID << 1 != SKB_GSO_TCP_FIXEDID_INNER);
+	/* Bit 0 of ip_fixedid is the outermost header, bit 1 the inner one. */
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4 |
-			(NAPI_GRO_CB(skb)->ip_fixedid * SKB_GSO_TCP_FIXEDID);
+		(((fixedid >> encap) & 1) * SKB_GSO_TCP_FIXEDID) |
+		((fixedid & encap) * SKB_GSO_TCP_FIXEDID_OUTER);
 
 	tcp_gro_complete(skb);
 	return 0;
diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index f1f612cd7b43..927e1535c47d 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -805,6 +805,16 @@ int xfrm_output(struct sock *sk, struct sk_buff *skb)
 		xfrm_state_hold(x);
 
 		xfrm_get_inner_ipproto(skb, x);
+		/*
+		 * Transport and BEET mode keep the IPv4 header and its ID, so
+		 * the header that SKB_GSO_TCP_FIXEDID describes is the outer
+		 * one as well.
+		 */
+		if (!skb->encapsulation &&
+		    (x->props.mode == XFRM_MODE_TRANSPORT ||
+		     x->props.mode == XFRM_MODE_BEET) &&
+		    (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID))
+			skb_shinfo(skb)->gso_type |= SKB_GSO_TCP_FIXEDID_OUTER;
 		skb->encapsulation = 1;
 
 		if (skb_is_gso(skb)) {
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 8d7228834305..e5aae5320af9 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -3097,20 +3097,22 @@ union bpf_attr {
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_L4_GRE**:
  *		  Clear GRE tunnel GSO flags (SKB_GSO_GRE and SKB_GSO_GRE_CSUM)
- *		  when decapsulating a GRE tunnel.
+ *		  and SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a GRE tunnel.
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_L4_UDP**:
  *		  Clear UDP tunnel GSO flags (SKB_GSO_UDP_TUNNEL and
- *		  SKB_GSO_UDP_TUNNEL_CSUM) when decapsulating a UDP tunnel.
+ *		  SKB_GSO_UDP_TUNNEL_CSUM) and SKB_GSO_TCP_FIXEDID_OUTER when
+ *		  decapsulating a UDP tunnel.
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_IPXIP4**:
- *		  Clear IPIP/SIT tunnel GSO flag (SKB_GSO_IPXIP4) when decapsulating
- *		  a tunnel with an outer IPv4 header (IPv4-in-IPv4 or IPv6-in-IPv4).
+ *		  Clear IPIP/SIT tunnel GSO flag (SKB_GSO_IPXIP4) and
+ *		  SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a tunnel with an
+ *		  outer IPv4 header (IPv4-in-IPv4 or IPv6-in-IPv4).
  *
  *		* **BPF_F_ADJ_ROOM_DECAP_IPXIP6**:
- *		  Clear IPv6 encapsulation tunnel GSO flag (SKB_GSO_IPXIP6) when
- *		  decapsulating a tunnel with an outer IPv6 header (IPv6-in-IPv6
- *		  or IPv4-in-IPv6).
+ *		  Clear IPv6 encapsulation tunnel GSO flag (SKB_GSO_IPXIP6) and
+ *		  SKB_GSO_TCP_FIXEDID_OUTER when decapsulating a tunnel with an
+ *		  outer IPv6 header (IPv6-in-IPv6 or IPv4-in-IPv6).
  *
  *		When using the decapsulation flags above, the skb->encapsulation
  *		flag is automatically cleared if all tunnel-specific GSO flags
-- 
2.53.0

