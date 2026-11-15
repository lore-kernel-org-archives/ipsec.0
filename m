Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737958;
	b=wdococIyRBWZo5ucHMqElE7TDL5+dbauH9Om0Bs5UU+dmGKl+EBpz7qMTN7rRPuLU0mJ
	 JrdW38OpDYZqme6EFxlCVGmdh43oPcjddzPHpBRdGkfsGtdPuzlcJ9y6kRa9fNo/ZJ9FM
	 JbsDfxHfmPPY4OXSd5Y1wJ/h0SkGEe6cUjh+2FPbxaD2I9lsEaUqNsQogFlN6gTz8WBDz
	 Kw7Dl7u0LtJj11mkPnYrv62Ib73BORJNSRb7rMoQHeLDwWBOfiefrZ51b4UpATZ/5nQdh
	 ph7j3YUbM+a4Vpgk4AD/KYAWMHoIlNgmKu1Cmq/h1PrdewDd1nb9+iDRuZzqLvdi1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
	b=IS42rg3up+AuYzp5qEpEG0P11wlbmhesZSHXLGBb5DSsd/N64po3hk4R1FIJAgKyaOha
	 DWkMsI2G22Yjc9tJvA0qS/cGUuGp6r8EVLQAOaLrzJc3LWdAWv2A3mA+jmWZ8nyyteQNH
	 Y0quQuBTs2rBNoQbmLecdp8knKhgfPvIJnWkcBMx1OJUok4xNtudTdPY/ughTiPtcYj+L
	 CNGKIcwGA3xF/EeMOWUQydMq/JuiYjb2ZQuhp/TTcfNqb2hC4I7D0uYgv7uzXFz7HpeHW
	 eWSIL6iO/r5i7ctjrWfcJdUeLHsiES48+duJuWOoGOFAkbC0POANpMn+coqZHONGwSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Ld4Zoael;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0C606A31D
	for <ipsec@lists.linux.dev>; Sun, 15 Nov 2026 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Ld4Zoael
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f30660e69so259676485a.0
        for <ipsec@lists.linux.dev>; Sun, 15 Nov 2026 02:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794737956; x=1795342756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
        b=Ld4Zoael23EGYshy/nayHoSPX6TBwNvZnzm/U5EnYrABG/sLl218FTXsI53Qwxttgl
         cvWSovGEkhTTWJMSI1W1f3OXhcEGuuzKK6YZw6vITogmWM0DrddJ17ielJ+rjZG2Gb0e
         R0jx5V4Zo7XGGU0sHvhbmZQvHrHfmNwdcmjWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737956; x=1795342756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhcPhq0Poj4iCa3rvuLGMg5AWfvy/+rEzDOs01y4iq8=;
        b=e56V4V4tv0qvn2OalXnxh8b7evc+KyZqv1/XJLVJtNCnv/d3oFFuR5kXGuBhZbvpgU
         P4UCvpdCgCINnBnXBZ1Y9hxE4MQj0wJkvkAdoSdXVb48W2dMER3hxkowZN6FygeNqagd
         6UsvYd3b0vqml70khsswBtMU/wV2BzjjQaBh+HUG27YdSjQCIMnxJiNoANiIt+qFUt1C
         XEvTpivTG+qHT7Nzm53yshjq/6/RWDGrUQZQnyCGlZOx3E4olgIC2aaMUDAbv+xxBcc+
         6/Y+Wq6MBIEuEi9Bsx2Lit/OLUipNm68VW6lePFZZ492VxHN/9Ght7l6NwJjHHM8HgkV
         Lb7A==
X-Forwarded-Encrypted: i=1; AL+hErEw2xTvhmqUb7V7a8l4jMgU6EorzasJi/KlNhIMSIQPFWC5LCyHeSsdGm0jKlTfQZVcudUbrQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9tvL5QAzgOCaUpYV5e04Hzv1FzqwdoL3ByWC5jU5HbC/70dszc
	fQoStWAIshFv1gZggnznRPPofzWjnjxXtCeshNlOJyXs4ybn1SuWCuHBCHfpwAzOtQ==
X-Gm-Gg: AYBFou1upk0+8byBxQux//t8Bdc6UpwlSTEWWGdrhUQkRftoTcoG4nxI/4W1od4enpy
	ujXOH7EYWcbhVMfnMdVUth7qIQDtCqya6++9ypKe8V/P+pZQDwWj5VPzCXeYIfvxsoW2qH8b04D
	+VQLlh97A4+Jfapm4h2itr+LephlYQJnDBTpyv5A8zaiHC+GjvIh8JLPvcexYaIDz7ta7H0FnpU
	DMoAF5/QJp9/2Cbyv8LGeY69A4kxSHPN5xI6DCnjFH8gK0eaeyfKjUWR4JC1dL8b6ciJXj4wz6U
	oZeALSs0wKXPARcsr/8qVjmwhMdhW5eaJbr3jqA8zkqM5GWwIOYPoYmai1MQ7Z0dxlj2HtP3uPe
	bMsZVZSM0qNI0z8SaZiphONyXZVb+d1R+exTKuX0vesA2XIlXCYED9QsxBevRxraiIfMxRdfBTd
	mxBHtkgwDRzQuyfol/J7WPP2YXjZPa0Wd92+TfGR+f+O5a6/sdDUej4siwJLq2MrBIfSZYhPxm5
	4j393Tj/x8w1UwRXIks9dEwQZy55uT/oMl/Nmowg8kNkKcKXecZ02azJaMXWYTHIyvWSxRIHC7j
	ZaUb8MLrB4fUe443OE4VrG7zkU+HRsW3u+2uWpzByMTojgEKx+mubNkZUunXV8Y/31bbFRkzXsr
	u
X-Received: by 2002:a05:620a:44d4:b0:949:6fd6:d05c with SMTP id af79cd13be357-9496fd6d08dmr443603885a.42.1794737956093;
        Sun, 15 Nov 2026 02:19:16 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm592337085a.5.2026.11.15.02.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:19:15 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	ipsec@lists.linux.dev,
	bpf@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	Victor Nogueira <victor@mojatatu.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Sashiko <sashiko-bot@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v3 0/4] net: drop the stale dst when steering to another device
Date: Sun, 15 Nov 2026 05:19:07 -0500
Message-Id: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com>
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

This patchset is created to address constant whining by both sashikos
about this being an issue when fixing a UAF on a teql issue, see:
https://lore.kernel.org/netdev/QDISC-6HS9.v4.r0.20261111094338@mojatatu.com/

Two producers steer a packet to a network device of their choosing and
then hand it to the neighbour layer for link-layer resolution:

  3/4 netfilter: the neighbour variant of nft `fwd`, on the netdev egress
      hook
  4/4 bpf: `bpf_redirect_neigh()` when the program supplies the nexthop

Both rewrite `skb->dev` to the target device and leave the skb's dst
pointing at the route the packet arrived through. When the target
device's neighbour for the nexthop is incomplete the packet is parked on
that neighbour's arp_queue, and draining the queue re-looks the neighbour
up from the stale dst. The frame is therefore built with the original
device's link-layer header and then transmitted on the target device: the
packet leaves with another device's addresses, and the sender never
learns that its nexthop was unreachable.

This is explicit: the steer-to-another-device path never worked in this
respect, so there is nothing here to regress. Both producers shipped with
`skb->dev` swapped to the target device and the route's dst still
attached, and the arp_queue drain has re-derived the neighbour from that
dst for as long as either producer has existed; the invariant "the skb's
dst describes where the skb is going", which the routing path keeps when
it steers, was never established for these two entry points. With no
commit to anchor with a `Fixes:` tag and no crash, UAF or lockup
involved, the series targets net-next and does not nominate `Cc: stable`:
a backport would change long-standing redirect behaviour for no
crash-class benefit.

More context: this came out of the review of the fix for a parked skb
being resolved against the wrong device in sch_teql, posted separately and
not part of this series. The neighbour code's queue drain is doing the
right thing there, it re-derives the neighbour from the skb, so the repair
belongs with the producers rather than with the drain path. Both
producers are fixed in the same series so neither is left behind; each
patch that changes a producer carries its own reproduction recipe.

The reproduction for both arms is a pair of veth devices, one of them
with an unresolved neighbour, plus a capture on the target's peer: the
captured frame's source and destination addresses name the device whose
neighbour was used to build it.

v2 drops the dst only when it describes a route, and keeps what the route
carries (thanks to Pablo for catching this). A `DST_METADATA` dst is the
tunnel template a tunnel helper attached to the packet, not a route, and
dropping it would discard the encapsulation parameters, so it is left in
place. A route carries encapsulation parameters too when it was installed
with an ip, ip6 or xfrm encapsulation; 2/4 adds a helper that moves them
onto a metadata dst before the route is released, so a producer that
steers into an external tunnel device still finds them in
`skb_tunnel_info()`, and one that steers into a `collect_md` xfrm interface
still finds its `if_id` and underlying device. Neither case weakens the fix:
a metadata dst resolves neighbours through `dst_blackhole_ops`, whose lookup
returns NULL, so the queue drain keeps the parking (target-device) neighbour
exactly as it does with no dst at all.

1/4 is a prerequisite on the xfrm path turned up after Pablo's comment.
The interface that consumes that metadata puts the original route back on the
skb before the xfrm lookup, which needs its family, and installing a
reference counted route over a dst slot that is still occupied trips the
slot assertion; the slot is cleared first. The same overwrite is in the
tc-bpf helper that attaches the metadata, so both sites are fixed in that patch.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com
Link: https://lore.kernel.org/netdev/20261026160747.283702-1-horms@kernel.org/
Link: https://lore.kernel.org/netdev/QDISC-6HS9.v4.r0.20261111094338@mojatatu.com/
Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/

---

v2 -> v3:
- Patch 2/4: Document the return value of skb_dst_drop_keep_metadata() in
  its kernel-doc comment. The missing `Return:` section was caught by
  NIPA CI.

v1 -> v2:
- Do not drop a dst that is not a route: a DST_METADATA dst is the tunnel
  template a tunnel helper attached to the packet, and dropping it discards
  the encapsulation parameters (Pablo Neira Ayuso).
- Keep a route's encapsulation parameters as well: a route installed with an
  ip, ip6 or xfrm encapsulation carries them in dst->lwtstate, which a drop
  would discard before a downstream tunnel or xfrm device could use them.
  The dst release now goes through a helper that moves them onto a metadata
  dst first (new 2/4).
- Fix the dst slot the xfrm consumer restores: a collect_md xfrm interface
  puts the original route back before the xfrm lookup, and installing it
  over a dst that is still there trips the slot assertion.  New 1/4 clears
  the slot first at both that site and in the tc-bpf helper that attaches
  the metadata.

Jamal Hadi Salim (4):
  net: xfrm: interface: restore dst_orig on every xfrm interface
  net: dst: keep the LWT metadata of a dropped route
  netfilter: nft_fwd_netdev: drop the stale dst when steering to a
    device
  bpf: drop the stale dst when redirecting to an explicit nexthop

 include/net/dst_metadata.h     |  1 +
 include/net/xfrm.h             |  2 -
 net/core/dst.c                 | 76 ++++++++++++++++++++++++++++++++++
 net/core/filter.c              | 12 ++----
 net/netfilter/nft_fwd_netdev.c |  6 +++
 net/xfrm/xfrm_interface_bpf.c  | 16 +++----
 net/xfrm/xfrm_interface_core.c | 22 +++++-----
 7 files changed, 104 insertions(+), 31 deletions(-)

-- 
2.43.0

