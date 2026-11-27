Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789559;
	b=HYpFn/QtvtuVnIKS+UXLMqY0kKLUewqQfje90w20vRrEr7uEfOfATEv1gxQqhS/oPYxi
	 2KGv5G5acSFoD+bOejxOyiu/YxZfkPG52H92FRK9rYckp2kKs4c3yuTvKBaHXYU2Iq7WA
	 R+5mi1CA4yL+WK5iUGbhZJrqZYaUqxJZqtpmUztYOflBEXWb/OSDjHWmrw4DVq+u9CI1f
	 SAq8FilFs3YFgS5tud9aDNyR/Lp7vQpxC864quvMAVefBnLAiWnyPP7kQhBhC7NaRHUqy
	 4fvdMs1Jpdsi1W+uuFDxIAlND+QcZ4WlIfFSBBI4RPD/nDfvXz6bUuMcvDry4AwfjPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
	b=Y2Puk5DVwRDBZMe+v8q82F3BTWi9x9fJsDsLITiGt4I579QF+jIFdgUnTlannWuoAOfV
	 FSE9l45ZnQIObe2bWp88ABqCEZl5rZo33J3c4FQmL54xATFz3zTm64zZGAcgO/fdJRT35
	 tMSxLGjNlL1At37nkQmRBszw4UmKTzY3I5HgcoYnc6ljN81hz4up/Ie0M8H0oA9GtFluU
	 zCk2Gt7LoMaccOY3kb0LQDNookQapZdaCN4+mbA3WRLLwyBXHPm2BYfTBcfhsVchdUfyN
	 nYqd5iEhOC5H9pwpSABDJzY00TSIWZWjL94CjZdPzUMtuw4x+y0xnIj11byMSR1pAog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=J7yB1z+B;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E67606E13B
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E67606E13B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=J7yB1z+B
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4211487a12.2
        for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795789557; x=1796394357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=J7yB1z+B8iTbKGZT68JP5Jqx4HcXw11to1VeqDJg6qV9K0vFMDMxbbOwVLDYBl1xYn
         aSzoIFIzOVOFI1J1dm2F+zBARzLifFMsRv405U3QIhPDUppi7HPQvnTEvaOQXiHGQR6c
         Ys9NyVGPm5E1f4jHbOURSuf3nSt2qgQ/GUrhHZoIBEOfLHH0n2RJt2KJbEv/N3YXxksk
         BlkBQ3AkMHGjWnVTZ5tIv3BfJuTFInK7DeYAxLlToy2prtpgHey/kYy1pFL3+uQjey+n
         aHRvQim1ueoRFnSXfHn3Fy3A4J0Ngb3wuAo0NTX0EAt1o/FU8klSj/rgCA4KaRDyuZkX
         fdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789557; x=1796394357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUYUcZ8zVrccdQp8eylc+qilfxVX7jnZyDSPYCH5vsQ=;
        b=0rPTwPYJ58lh9LiUSnweW7n/BSLMVZOKWTEil/EpIN7+TfWmuOSDGCiWfrMvRvbGc9
         vef8mVfyrR5eaJ1L4PAz3rfmsVty4z5SnbwDVBhEmibyNqITaF3fQVfPDLoGu8hb9g8s
         G0bvXnUXUxatlXsaxY76yLCGxsE4EE+CHPizA6baK9j+n6H/7Atf/wFJN98czB0Wxjbo
         WRFT+GOkMO3hT0luLLz1HX3K8otoFwM/k1Xd2IprR1C7E0j4P2/GBeCTtyCfQH2sgcbm
         ai6XzsRytA6q8mTrCwNyAm6o/MLzqtLn2sM/YOsYxdTbhSliC0JUVxkK2e2u5ualhEpH
         QRxg==
X-Forwarded-Encrypted: i=1; AL+hErEDtuhKloGjjhOM59kgMvdSIH0J/kJaLma7JJdRYiXykGUdvZswEpdroUw4s50lCw+aU3QTQg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6Z8FJGPKr13ZBW9Qz4eL8W4OEFsG3fL2/sDaP2l2TcjyFEms1
	rECdOCNIhCHh3KO2nmr/vQgfcXIqWrsHjYWO0btChic51N9BaxLA0YndLj53l5pQs4Y=
X-Gm-Gg: AZFdTZeGANYrP8lnMKnN7YMnoHh0Nc9RDav7XNEuiBu3hKONzS8KP7F/iLKO5RBs55H
	sjNRkQ5x8FWaD5tNwtyYmMKYpsXEzMT14zL1uM0PpRMQ1cAf2JFHJHo++wPKZQk0LG7JyPe2kW5
	aFWgtDf8EPB1U7gi4g1YHYeeM8jt6C0AxikNKOE6xwdqDfu5HjxyOgtffHZswAKqNJ1mVEzkAuH
	TWklu8flllbgTLtMNXFOk33rRNJQlZvRLTgCAY5RSNfGkx8P/4UGrchBo8C0T+G22Rlyaun1Ep+
	1oipgYLd7j2/WnC1Kc4ev4b8gQlfp0XjloMkZjM8hMc33gGcVxA+fssrkE6SdJrGC+S+j60T4/e
	B7mTEKnr2/LCHZhGSbLsiFnhnzOQ+V1K9E2zgttygjVXViTJSsvvVEyja6azsQFKj4g183HJumm
	e814IT3caYSIsBKsZom4HqpJFxOUjXNzgsD5yqpjcye5+WjFLWQ1mKRoYNvVQC/sa/0fZP8dN21
	wGw0nHq9Tlo+ji3Orqj6KHO6rTqat+ysVB3csko9cRHlPr/lvzqw/bF1RRb8QHprYVb5Mhnt5Uq
	T1XalY5g5sJ4+5hdAm2FeM3OsC07G7YBRwtUMsrU4dxOPKPoMvwf9Kc1zw==
X-Received: by 2002:a17:90b:4b86:b0:3b5:35eb:5e94 with SMTP id 98e67ed59e1d1-3b535eb5ff2mr2981408a91.41.1795789556690;
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm18324629a91.17.2026.11.27.06.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:25:56 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: report the too big error to the frame's own socket
Date: Fri, 27 Nov 2026 21:25:50 +0700
Message-ID: <20261127142550.66326-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

iptfs_is_too_big() calls xfrm_local_error() when its sk argument is set,
but xfrm_local_error() reports to skb->sk and dereferences it. vxlan
passes its tunnel socket as sk for a forwarded frame that has no
skb->sk, so an oversized forwarded frame on an IP-TFS SA with dont-frag
oopses:

  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   iptfs_output_collect+0x2c2/0x1170
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   ip6_forward+0x1573/0x35c0

Check the frame's own full socket instead, as xfrm4_tunnel_check_size()
does, so a forwarded frame gets the ICMP error. Drop the now unused sk
argument.

Reproduced on a KASAN kernel with vxlan forwarding over an IP-TFS SA;
with the fix the oops is gone and an ICMPv6 Packet Too Big is sent. The
xfrm_state.sh, xfrm_policy.sh, xfrm_policy_add_speed.sh,
vrf-xfrm-tests.sh, pmtu.sh and ipsec selftests pass with and without the
fix.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179551712630.3135.52212996809224784@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---
Assisted by Claude Opus 5.5 (claude-opus-5-5).

A KASAN reproducer (single VM, vxlan forwarding over an IP-TFS SA) is
available on request.

 net/xfrm/xfrm_iptfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..ccdde630a825 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1813,7 +1813,7 @@ static int iptfs_get_cur_pmtu(struct xfrm_state *x, struct xfrm_iptfs_data *xtfs
 	return pmtu;
 }
 
-static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
+static int iptfs_is_too_big(struct sk_buff *skb, u32 pmtu)
 {
 	if (skb->len <= pmtu)
 		return 0;
@@ -1824,7 +1824,7 @@ static int iptfs_is_too_big(struct sock *sk, struct sk_buff *skb, u32 pmtu)
 	if (skb->dev)
 		XFRM_INC_STATS(dev_net(skb->dev), LINUX_MIB_XFRMOUTERROR);
 
-	if (sk)
+	if (skb_to_full_sk(skb))
 		xfrm_local_error(skb, pmtu);
 	else if (ip_hdr(skb)->version == 4)
 		icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(pmtu));
@@ -1908,7 +1908,7 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 		/* If the user indicated no iptfs fragmenting check before
 		 * enqueue.
 		 */
-		if (xtfs->cfg.dont_frag && iptfs_is_too_big(sk, skb, pmtu)) {
+		if (xtfs->cfg.dont_frag && iptfs_is_too_big(skb, pmtu)) {
 			trace_iptfs_too_big(skb, xtfs, pmtu, was_gso);
 			kfree_skb_reason(skb, SKB_DROP_REASON_PKT_TOO_BIG);
 			continue;
-- 
2.52.0

