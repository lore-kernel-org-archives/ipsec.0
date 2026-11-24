Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504143;
	b=hI0fBGzsods3xiNsg/Z3r9aBgVWx9s3SeRCmbLfRa3KvwiNsfGJC8avR+/Lp+DHUblz3
	 f5cdZPPF3h6esFrw3oKU+72nRq8gG2rYTy3jex4I0DYP5InZM3NTx9HBGavU9aC4kgF6+
	 nLmOCs2qj0lmpXJnS/CeCboexWusuT2GHxArUf52QYZ7/LlJFxRL16jSRjdJdJCplavBo
	 pO6WzDc2T6euknrPvrZ5VJJ9saV4WLuBgaEqzJX8yVMSjD5reQDeypCf/UyaNh42PFyCo
	 woUi2EIhYw+RSFAxhM13pPVMTkVpnDz8daOE4dlCTvjIqeX5DhoE7D6XEyYajOAOVGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
	b=vlLgoywq7Kw15b0Gax+dP2F7xZUxL8Dmzutd3d6eCgBFpMCcWwJUlfZ+5CQ0j89w/qzl
	 WVo0OJUYdGSeVvhmiVts5kdk3ndshbxpl+C5nAr8VlZ4xgUd/8A7YSo10CP3v943Pjghc
	 FFFonE/p3Yj55KMs+z9iS0bkPv/UA4PL6cIHIrRjGPlliDt+9qiE4kUgOoZUf8fMqVtYp
	 QbSKS3mrqgdXE+UG6UV2d7euAgUSZjY3xhf6P7c347k3kFX5yBQVzjPZ3/F0tk78We9M3
	 v8L8CnesILuZ84VdocdK42Gw/0eb87PmiE2kCo7WVPRD38rK93q+L0NsUB1Pwh0Sa8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUWjaolj;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2A606A322
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA2A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUWjaolj
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b271e573adso1739112b3a.2
        for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504142; x=1796108942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
        b=RUWjaolj4MYrsjH8couhTLS3Cw+ZkX9VZSwsvPRZAXCM3L/rFEI7+YgRF6yLxAQOF6
         5kdzQ8wuIJjDto4q6Cbsr5Lqc7azmfEMKTknoAX51rTkke7LIL4VUCIGIz477zITkcG3
         8Brmmm5wjBVol4IPn3R4cy9Pc/PdX0P7b8TEHxqaki8rUCxu0N4HMUfvO/PiRH55Tqm0
         XiZYPKd5lLb7uTJVsO/6WGpzLdb7DQs4QHgahWC4IxSp1WsA8ujeWXoSQnGJw9bchKc+
         7D0TIy2z7Fe7PYdONbp5+KwXiZi/Mkf83h7LPvqKaixh9Yf1L6RKhro+P0jiOO0ynBLz
         gdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504142; x=1796108942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
        b=0plTNBuUCjW35H9p43g77gYL1eHbf2qlSc774GVMh4UScMtkVpv/5o5vzDEXIQjpHs
         43YXeYE6jLFdkvOLI6F2/u+V4NKjnhAckxzLUV30Xg+f1kZJrVRpjnFS8+fNuQdrzSJm
         Br833jYCaSZQvUgET3n/gjP44d4Zs1X/hrPkratdBAINSapV4XnUrkDkMAa91aGRh56Z
         378QUhz/c5Wb0YKV5XFHVzNLN6NPSOrRVWmA7PV7bVyru3kNkaZv3xr2zBsnjgK3mXp4
         c6DT4eR6vV5NwG0yWhLuFFZIZK7uLiXtrsVjgFdgsg29dr2mMXj5l8mCoV4UIqWa+0yh
         RGjg==
X-Forwarded-Encrypted: i=1; AL+hErHFqRrydf5efwqN6U/v4WDBGReMfoMufS9dfoSqYBNBasq2oaaUxxLyxcyGST0jx05Cqv6sKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z81ooa8jlk3GeEHKUElyP/UtRgQ/cotMa5FU4n99HZt8ljMp4zr
	Y01PGIQsXIpr0O6mIm4sXNh4sf0sr+58T+kVnzsxQZ32WRbpraauz3VjGhpldCVI
X-Gm-Gg: AZFdTZeiR9//SokOh4GmBcKLsU4Rktxs8hPBt3EpyM9NgybU/kiptHxpSlw1jt2W95Z
	Y26yosG329aU/P0/i8t++xKIKvThmn1A+NCwk65HGkZC9suMebLwilXAoCzN4smOkrUxCnkWKe0
	eK93nvCJXdf1IVi5yCLzk0VmvNRwny4UipcrjBQfErvKVNG4iRuDDU8ciiEZrX5Q9C3pmNChCoI
	xjCADbvnsrLatWAuC10JZKUzK0PLhLfNoMum+4FM1pGvuAQAvT180owFyncl7wN6VSn2xovnJgX
	33rUmN09kdrCAeC39FBQPwByLgBGs3WYpbdPljwnrmVxe0yYqf4Cst7LkFlY2574yC4oFNFv6uG
	P9giw9zHwEWvgcRUX2WjRfpLLKjHm/qGbAtQDApqrapxHLroJ173OQ0+tTFrKfQO3TxoTNPnRt+
	qYzAzKfjoGTUyfHR3KKNmfTiOnlXRo4xLCdfaruYzf/evQRswRVeShYujLu0gSKtLvDcxvvLn+F
	Ga5UvK6c1VNKKRhuSi2f3dNmgFXq8qjYvv1rL2oS5FBWnGwKcTcwHKjgoNkIDoXiAqjyOAWnC8P
	70AobitKRBevxbAbDkMiX3Kx/npRkLL0c83oWaRVDKX4JgImlnbzi58/3VrSlB1ZeEY=
X-Received: by 2002:a05:6a00:94c8:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8c87d01fbc2mr12088013b3a.48.1795504142083;
        Mon, 23 Nov 2026 23:09:02 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6748955b3a.3.2026.11.23.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:09:01 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: allow route optimization mode only for DSTOPTS and ROUTING states
Date: Tue, 24 Nov 2026 16:08:56 +0900
Message-ID: <179550330841.535592.4607028415857424638@gmail.com>
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

verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
protocol. esp6_init_state() treats a mode it does not know as
transport, so an ESP state in that mode is created, and the first
packet through it hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
xfrm_inner_mode_input(), which assume that route optimization never
comes with ESP:

  WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
  RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
  Call Trace:
   <TASK>
   xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
   xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
   xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
   xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
   ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
   udpv6_sendmsg (net/ipv6/udp.c:1699)

  WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
  RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
  Call Trace:
   <IRQ>
   xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
   ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)

Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
already limited to ESP.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Steffen asked for this on our report:
https://lore.kernel.org/netdev/awUsEE7XZIFwc0Ws@gauss4/
Hui Peng posted a patch with this description in September, but its
diff changed attach_auth_trunc() instead:
https://lore.kernel.org/all/20260919215239.3471352-1-benquike@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype. The patch was written with LLM
assistance; we reviewed and tested it. With it, the ESP state of the
reproducer is refused with -EINVAL and the warnings are gone, while
DSTOPTS and ROUTING states in route optimization mode and ESP states in
transport and tunnel mode are still accepted.

 net/xfrm/xfrm_user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 217f65faa2bd..c4bbfd638d73 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -477,9 +477,16 @@ static int verify_newsa_info(struct xfrm_usersa_info *p,
 	switch (p->mode) {
 	case XFRM_MODE_TRANSPORT:
 	case XFRM_MODE_TUNNEL:
-	case XFRM_MODE_ROUTEOPTIMIZATION:
 	case XFRM_MODE_BEET:
 		break;
+	case XFRM_MODE_ROUTEOPTIMIZATION:
+		if (p->id.proto != IPPROTO_DSTOPTS &&
+		    p->id.proto != IPPROTO_ROUTING) {
+			NL_SET_ERR_MSG(extack,
+				       "Route optimization mode requires DSTOPTS or ROUTING");
+			goto out;
+		}
+		break;
 	case XFRM_MODE_IPTFS:
 		if (p->id.proto != IPPROTO_ESP) {
 			NL_SET_ERR_MSG(extack, "IP-TFS mode only supported with ESP");
-- 
2.43.0

