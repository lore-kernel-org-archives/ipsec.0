Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855708;
	b=BsNedWSU1QBe39NvtjLeNoazj8AJbPIINNaLTidftJLVgBKxubPRXIO+y4nlz2kse7d3
	 oWnm42C85Jm/xzwF4X3LRB2iJthYEZzla36wzca0fiSFOK1OxqVyWusUT857UKH+rpmmZ
	 4kxMQjH7+jxIgBfK3CyZuryovWzM75hiCP7Lpmh7b+YJA66nWWLBQ2xV5IfP3G1Wr+Yop
	 8QoriClig40ZUYExDTHeQTlduOVNgF/KMY9R6fniG8OM6UEcGfP2nNXl9GgKdopm6ElHE
	 eKODbd6jT08h4hA0ETp6JsDopf3Oj7qE4L7tak8/J5BY5xzeJTyRzFL0gobJPDgMCzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cw/BVa7eJbiscvjL5aeyO7U6YquYlPCCRzpuqZhRipc=;
	b=LkzR1rThBiqYIQdJJTqwWebQrB9/iwCSJKI+keFiTm1B9RQUWjDxX0n96MzJrahToOmS
	 +z4qVTcePBBV7a3c0xi/dzwyCbOwRasYvFywm6mNsl3ilS7EfFQq4bodDRzZ+XETEpQUK
	 Bgt3bMeroVLexxrITye2saUbrNi35q/ZhestJ1jYBy7fSeAECS18VUWmw6TdR2+8Q9CJ4
	 TiNWq9LBdd2LXX7JS6jydS6ir6km7/FcZELyEbGEj5qtAhrXGmzXP5I4hdQAT0AKKtkbL
	 E4BaEsvCgLbGwDrBnMSgj2qR201kSKTXmjmdQK/LMPchjWNYFwYivY7g+NBQ+T+GjrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JJnWgBH6;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD6606A332
	for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 19:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BD6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JJnWgBH6
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so3376726137.0
        for <ipsec@lists.linux.dev>; Mon, 16 Nov 2026 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794855707; x=1795460507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cw/BVa7eJbiscvjL5aeyO7U6YquYlPCCRzpuqZhRipc=;
        b=JJnWgBH6/t+f0l/vX7MrqeRDwhl+wk+7dX5EFhCBDd52gfjtAyNQadFDA6w4SHON+/
         m9pFNt7TTxOlnllE55KnIUiQAJSqKh/tEPIZvC7m+lEQgXgNTF/4KhGTgzeJ+lT7nsV2
         sf5OnywaoUW+M5CngWA6kssUqB5Hi9jxkNPMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855707; x=1795460507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cw/BVa7eJbiscvjL5aeyO7U6YquYlPCCRzpuqZhRipc=;
        b=hL8UP40x5cRpqLiATr8IW5kHb8zehPoD3cSmpqC0GV3QQtXWm5eKxf6uaYsCBo+A2D
         71a1wBuyqmnSMnT0d7C3tSTCs7Bgg/HfjtsslWjN+R1/tzhvTHB2ipD8hVgxAxEOTDAn
         ab8a4CoiiMF9HnfQrwKoWtwHlAsmT7eZWcOxmxuExFkOqct1vboYlWha5pO1eSiD6v6n
         aBJczdb6LoLcBAkbup9ZaGFDfK1XOpEhtyVPBGpcZXa9c06GlDsFxYkcahiKWPJOX1Rz
         Ros1iGdkimclV4HFIjOoH4Gm39Ba4lXy+pvNClDLckEe9bib7XhcpWJQX+Hy/u9VaEJc
         Eefg==
X-Forwarded-Encrypted: i=1; AL+hErH0FX1B+cLmAmKWT4gESX2LX9aRzItk7iHWzv2ucu7JJCAcX6CkPtKKitY5rnSM/mXoQG/QLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9eA6Dafth6BIjxj5j2ulkw5208gNm7MMT+AbhGkVkwiQahhmw7
	gOeAN1sw+I2uO0/1TQrv3tN2SDvuy/hVVDIKdzwjP39/prEtVuLrmYKQVXxEfdK2lg==
X-Gm-Gg: AYBFou210plOKW6+jgU9Jbe+YbnzQuVopPjY8vPqg9mby/itE3RWkrbVvamsO7gKO9+
	NumrvYk75a/T1yf6ARgZXbxU6o8o5d49M7hnTtaznMSz927S85kCdhUTs6mTCaOzsGPOa333xv/
	nI3eJ+zn/tiljJfksWCpln8QB8WrtL+8KA5pg6poTGEPmdW/adCM9oeYMKTv/8KFrLjuzm3qbAG
	vK732oUw0ipNk/sBl882hfel+UA2paxXEZg56mn9SF1xnqcWuxLNWkHfIkD4PgO0gNT6ugUW0cF
	Xg+yczzc50MuubV/VofoSNN110mTzEgjNwnb1gPOY7TW2RgYbBLSTl1GjR9OFW4yvfXYSRdG1NZ
	qTFrqei2NWaxoRQpdnTP0qQymubuGQU4xSPRcqCS6DkSeAi6lSt8f7bo5wb+RkidG3GRRejwrT6
	vlSIiR0bzp4YBWjKq5eR+/tSffJXexFGg7D09BKxgSyQ0YfAsZFXwK3l/gcs0zL2DhNphBEMS6g
	E3B37fqckg/SP4cDuE1spfhPnwciIV3NPpIl3Mum3Vv/ctO7QdqT4/AvoT4+AF2BsJb3qz8w0XC
	naSeZbNe6v31bj2E1EHmdMEK8QRxzPd4nqrfvg+8vthkv4yR75AEJu3jeriXMbzhl+brzX9n734
	=
X-Received: by 2002:a67:e7c1:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d64d468432mr4302490137.1.1794855706870;
        Mon, 16 Nov 2026 11:01:46 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm91997386d6.10.2026.11.16.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:01:45 -0800 (PST)
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
Subject: [PATCH net-next v4 0/4] net: drop the stale dst when steering to another device
Date: Mon, 16 Nov 2026 14:01:37 -0500
Message-Id: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com>
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

The Sashiko reviews of v3 raised two questions about the release, one on
3/4 and one on 4/4: what the target device's transmit path sees once the
route is gone, and whether the older fallback to skb_rtable() in the tunnel
transmit paths is reachable from it. Neither needs the release narrowed,
and both are answered here.

A target device's transmit path still sees the route of the device the
packet arrived on, for the few consumers that read it on the way out. A
tunnel with no configured remote takes its outer endpoint from that route,
so a packet whose route carried no encapsulation parameters is left with no
dst, counted as a transmit error and dropped, rather than encapsulated
towards an endpoint that belongs to another device's path. The route realm
goes with it: a realm is a property of the route the packet took, so nft
meta rtclassid and nft rt classid stop matching on that packet, and
bpf_get_route_realm() returns 0. Encapsulation parameters are not among
what is lost: they moved onto the metadata dst, so a tunnel or an xfrm
interface downstream still builds its outer header. Taking the outer
endpoint or the realm from another device's route is the same cross-device
reuse the release removes at the neighbour lookup, so these are the
intended consequences, not gaps.

The skb_rtable() fallback is older than this series. When a tunnel cannot
take an endpoint from the skb, ip_tunnel_xmit() and ip6_tnl_xmit() cast
whatever dst the skb carries to an rtable, and a metadata dst is not one.
A tc-bpf program that calls bpf_skb_set_tunnel_key() with no remote
already hands an NBMA tunnel such a dst, so the cast is reachable without
this series; the release can also leave one behind when a route's
encapsulation parameters are not usable for the payload. Repairing the cast
is a separate change, and 3/4 and 4/4 say so.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v3.r0.20261103062649-2@mojatatu.com
Link: https://lore.kernel.org/netdev/20261026160747.283702-1-horms@kernel.org/
Link: https://lore.kernel.org/netdev/QDISC-6HS9.v4.r0.20261111094338@mojatatu.com/
Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/
Link: https://sashiko.dev/#/patchset/CORE-9NOG.v3.r0.20261115050625%40mojatatu.com
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/CORE-9NOG.v3.r0.20261115050625%40mojatatu.com

---

v3 -> v4 (no patch changes code in this revision):
- Answer the two Sashiko review questions about the release: what the
  target device's transmit path still sees, and whether the older
  skb_rtable() fallback in the tunnel transmit paths is reachable from it.
- Patch 1/4: comment and commit-log change, no code change. The conditions
  to recreate the bug are rewritten around the two arms, and the comment on
  the dst slot swap says what owns the reference it clears.
- Patch 2/4: kernel-doc comment and commit-log change, no code change. The
  docstring's Return: section is corrected, and the log says the helper has
  no caller of its own at this commit.
- Patch 3/4: commit-log change only, the diff is unchanged from v3. The log
  gains the section on what the target device's transmit path still sees and
  the note on the older skb_rtable() fallback.
- Patch 4/4: commit-log change only, the diff is unchanged from v3. Same two
  sections in the log.

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
 net/core/dst.c                 | 79 ++++++++++++++++++++++++++++++++++
 net/core/filter.c              | 12 ++----
 net/netfilter/nft_fwd_netdev.c |  6 +++
 net/xfrm/xfrm_interface_bpf.c  | 19 ++++----
 net/xfrm/xfrm_interface_core.c | 22 +++++-----
 7 files changed, 110 insertions(+), 31 deletions(-)

-- 
2.43.0
