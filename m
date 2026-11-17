Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903209;
	b=sEDxhsSMRjRwli4bItyTFh8pYkAVOp/h0OgF9TJfPDpjCPD/gyaKsM54EtMKU0YEiwWV
	 A01Evn5q4YLeo0Dv3Zz6AXaSZgQ+E6gV17ItwVZViu7/gCdy7H9YRprnuaENhYmhoBkjH
	 uXik6A0BZpE+B5BAyTr3anxccrhE/43UYQfMkqgbnzr1mrUF4HRaAm6uWikUlikx/dZ86
	 XCmfkfhmE2f19tPPxyPaDc36vmoc8jxkmDRqP2tu3myp+QzRwn5Yoa2NcP2yW6MFyjJiJ
	 oq+AkZyT39eFaUU1nPo0CviiPv6TG4rvX5535ChtLdBjXWEUIZJDSwdZIrIlYPgip6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903209;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lQB+J2MUxsbHmUdcUU+hTdyQoDrzF8koleThUVktVJQ=;
	b=ymJCeCgS97agzUr17TI0r9pnfJ6NZRdQ10TzH6jC5IYBaRcPpaQe3f3bZj6IM71JOYwL
	 EAzghGtsylJvbfgbeMlYLptLeDxfSJi0X0Rf/hKLPftzmddbXGDZl/ZiDvmEQQPw9UQdw
	 oUKhjIOpGc1S7Ae1wx6YCHABan1PP0ZNgYK4QErJd4YQ5iJzAqiBFmKodeZn2KMSrZOwn
	 B9QA1vs9uLRjA6FUr4TvZRmVcK4wRcTIZXWJDbzyiyCGMx67eZdLGN+emNCxNFiV0VvJF
	 hNBskx/TEK555L40aLZmi+QzeYRr1quxpvZQNGsaEJlleuppxu56NIJUzOBXLTKgYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep02Zq46;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1F606A31C
	for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ep02Zq46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C4F1F000C7
	for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903208;
	bh=lQB+J2MUxsbHmUdcUU+hTdyQoDrzF8koleThUVktVJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ep02Zq46oe1QP3hyX1miQVevb6ZFN07ZZtHFc93foY3OwxfH+j+JzrsAsALfslr0t
	 aO9ciij34q/wGL23yHFZjgZ99qB+q3NspvqDx5KISJka/2fATKBemv6pkf9bSXPKZa
	 kvrjvK9XWmFms6qOHzj49SBtusNDFjRrFM+Czrak3aRSAmFbegOUq5Pa6VwsZOlz4/
	 Y1k5VIL4QPLYcGLqi6PhUSq3y6sq+hdeE/0U84bRVQnss0FB8Z7u9oXko2yhNmkCpH
	 7Yg9+FgVwQuSxeb6YOftapAE0JqNSbsNtidFVYtnhMrV2d8SVr4/Yhixuc/NOg7YeH
	 EPIJqQLE3PLFw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso4519440eaf.2
        for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 00:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErExjjUbbI91S0FdR38YbdZSB+yMOXFxD8qS6wcHl2hDLKmNDVPkd3HD2DTwoS2o8fubLs0eOA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+fsYVEARm2gpUGoBKhuXREziYDE3HUzH+YSjPWwfq1qyZQuH0g
	Nsq1t/TtNqatvX7XEAIhNs7LEeSszba4eIR2GSjsrrxlX1AU4OgMLJ383cQRA91RaUTGuycBaia
	a6W4B1+XGr/3QOhtzqd1mobb/RiKeKio=
X-Received: by 2002:a05:6820:1353:b0:719:1ad8:a34a with SMTP id
 006d021491bc7-71ab51ad506mr8341496eaf.67.1794903208187; Tue, 17 Nov 2026
 00:13:28 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117062046.3286096-1-piyus@iiitd.ac.in>
In-Reply-To: <20261117062046.3286096-1-piyus@iiitd.ac.in>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:13:17 +0100
X-Gmail-Original-Message-ID: <CAL4Wiipye9XojWhp2-XqPC0kABk3LsTmE8Z0D779+GJT_A7N8g@mail.gmail.com>
X-Gm-Features: AclHuK-dyHZK5hz8I9a-NFKGKXmwEhICv0yQRNbmz34FLDe8dksam2yG5mccZtE
Message-ID: <CAL4Wiipye9XojWhp2-XqPC0kABk3LsTmE8Z0D779+GJT_A7N8g@mail.gmail.com>
Subject: Re: [PATCH net v2] xfrm: do not write the ethernet header when the
 mac header is unset
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Andrea Mayer <andrea.mayer@uniroma2.it>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 07:21, Piyus Kedia <piyus@iiitd.ac.in> a =C3=A9=
crit :
>
> xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
> mac header after removing the tunnel header and then stamp the protocol
> into it:
>
>         skb_reset_network_header(skb);
>         skb_mac_header_rebuild(skb);
>         if (skb->mac_len)
>                 eth_hdr(skb)->h_proto =3D skb->protocol;
>
> skb_mac_header_rebuild() does nothing at all when the mac header was
> never set:
>
>         static inline void skb_mac_header_rebuild(struct sk_buff *skb)
>         {
>                 if (skb_mac_header_was_set(skb)) {
>                         ...
>                 }
>         }
>
> and it does not clear skb->mac_len either, so on an skb whose mac header
> has been unset while mac_len stayed behind, the guard is true and the
> store goes through an unset header.  skb_mac_header() is
> skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
> so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
> bytes past skb->head: a two-byte out-of-bounds write landing far outside
> the skb, in whatever object happens to be there.
>
> skb_unset_mac_header() leaves skb->mac_len alone, and of its callers only
> skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
> (SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
> VRF device can rebuild it, and leaves mac_len at the value the original
> ethernet frame had, which is how an skb in this state reaches xfrm input:
>
>   tun_get_user -> netif_receive_skb -> lwtunnel_input
>     -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
>     -> skb_unset_mac_header (mac_len stays 14)
>     -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
>     -> xfrm_input -> xfrm4_remove_tunnel_encap
>
>   BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
>        net/xfrm/xfrm_input.c:258
>   Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
>   ...
>   The buggy address belongs to the object at ffff88805f858000
>    which belongs to the cache zswap_entry of size 56
>
> The address does not depend on mac_len - it is always
> skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
> sentinel is what mac_header holds - and mac_len only decides whether the
> write happens.  The value is skb->protocol.  It is two bytes at a fixed
> 64KB offset, crossing into an unrelated slab cache.
>
> A THIRD SITE HAS THE SAME THREE LINES, in __input_process_payload()
> (net/xfrm/xfrm_iptfs.c), reached when an IPTFS payload is decapsulated:
>
>         skb->protocol =3D protocol;
>         skb_mac_header_rebuild(skb);
>         if (skb->mac_len)
>                 eth_hdr(skb)->h_proto =3D skb->protocol;
>
> and it has its own KASAN report, a use-after-free rather than an
> out-of-bounds, for the reason given below.
>
> That function already knows the test is needed.  Its other mac-header pat=
h
> is guarded by old_mac, which it computes at the top as
>
>         old_mac =3D skb_mac_header_was_set(skb) ? skb_mac_header(skb) : N=
ULL;
>
> and only rebuilds the header when that is non-NULL.  The site above omits
> the same check.
>
> WHY THE THREE REPORTS CARRY DIFFERENT TITLES, which is worth stating so
> they are not read as three defects.  The address written is a fixed
> skb->head + 0xffff + offsetof(struct ethhdr, h_proto), so what it lands i=
n
> is whatever the allocator placed 16 pages past the skb: a live object giv=
es
> slab-out-of-bounds, a freed one or a page back on the buddy free list giv=
es
> use-after-free, and a different LIVE object gives nothing at all, since
> generic KASAN only tests whether the target address is poisoned.  Across
> six boots of one reproducer the write executed in five and KASAN reported
> it in one.  On a kernel without KASAN it is always silent.
>
> Only write the ethernet header when there is one.  This mirrors what
> xfrm4_transport_input() already does, where the header length is taken as
> skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and what
> __input_process_payload() already does for old_mac, and it leaves the
> behaviour of every well-formed skb unchanged.
>
> Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.i=
n
> Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
> ---
>
> v2:
>   - guard the third site, net/xfrm/xfrm_iptfs.c in __input_process_payloa=
d().
>     It has the same three lines and its own KASAN report, a use-after-fre=
e,
>     and v1 left it alone - which would have closed two write sites of the
>     three while leaving a confirmed one live.
>   - say why the three reports carry different titles (slab-out-of-bounds,
>     use-after-free, use-after-free): the address is fixed relative to
>     skb->head, so the verdict is decided by whatever the allocator put 16
>     pages later, and a live neighbour gives no report at all.
>   - cite __input_process_payload()'s own old_mac computation as the in-tr=
ee
>     precedent alongside xfrm4_transport_input()'s.
>
>   No change to the two hunks v1 carried.
>
> Tested at runtime on mainline before and after: both kernels built from
> aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
> CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
> CONFIG_NET_VRF. Six boots each, injecting after the uptime passed 130s. T=
he
> skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the contr=
ol:
> they fire when the unset-header skb reaches the receive path and this pat=
ch
> does not touch that site.
>
>                   skb came through   reached the write   KASAN
>   unpatched         5 of 6 boots       5 of 5             1
>   patched           2 of 6 boots       0 of 2             0
>
> Every unpatched boot in which the skb arrived reached the write; no patch=
ed
> boot did, including the two in which the control shows the same skb arriv=
ing.
> The one-in-five KASAN rate is the point made in the changelog about the
> verdict depending on the neighbour.
>
> checkpatch reports one thing, the missing Fixes: tag. Neither tree we
> reproduced on carries history for these files, so we could not determine =
the
> introducing commit; we will add it if you can name it.
>
>  net/xfrm/xfrm_input.c | 4 ++--
>  net/xfrm/xfrm_iptfs.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> index 5ed87d513..624ff8055 100644
> --- a/net/xfrm/xfrm_input.c
> +++ b/net/xfrm/xfrm_input.c
> @@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_stat=
e *x, struct sk_buff *skb)
>
>         skb_reset_network_header(skb);
>         skb_mac_header_rebuild(skb);
> -       if (skb->mac_len)
> +       if (skb_mac_header_was_set(skb) && skb->mac_len)
>                 eth_hdr(skb)->h_proto =3D skb->protocol;
>
>         err =3D 0;
> @@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_stat=
e *x, struct sk_buff *skb)
>
>         skb_reset_network_header(skb);
>         skb_mac_header_rebuild(skb);
> -       if (skb->mac_len)
> +       if (skb_mac_header_was_set(skb) && skb->mac_len)
>                 eth_hdr(skb)->h_proto =3D skb->protocol;
>
>         err =3D 0;
> diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> index 0313a43aa..41af72a92 100644
> --- a/net/xfrm/xfrm_iptfs.c
> +++ b/net/xfrm/xfrm_iptfs.c
> @@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_sta=
te *x, u32 data,
>
>                                 skb->protocol =3D protocol;
>                                 skb_mac_header_rebuild(skb);
> -                               if (skb->mac_len)
> +                               if (skb_mac_header_was_set(skb) && skb->m=
ac_len)
>                                         eth_hdr(skb)->h_proto =3D skb->pr=
otocol;
>
>                                 /* all pointers could be changed now rese=
t walk */
> --
> 2.34.1

I think you are fixing the wrong layer.

I would have used something more generic.

net: clear skb->mac_len in skb_unset_mac_header()

skb_unset_mac_header() marks the mac header as unset but leaves
skb->mac_len alone, so an skb can end up with no mac header and a
non-zero mac_len. Code that uses mac_len to decide whether a mac
header is present is then misled.

end_dt_vrf_rcv() (SRv6 End.DT4/End.DT6) unsets the mac header of the
decapsulated packet so that the VRF device can rebuild it. The VRF
device only does so when a packet sniffer is attached, so without one
the skb continues up the stack with mac_len =3D=3D 14. In
xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap(),
skb_mac_header_rebuild() is a no-op for such an skb, and the following

        if (skb->mac_len)
                eth_hdr(skb)->h_proto =3D skb->protocol;

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

Clear mac_len in skb_unset_mac_header() so that all callers leave the
skb in a consistent state, and remove the now redundant assignment in
skb_carve_reset_headers(). The other callers are on egress paths
(__bpf_redirect_neigh(), bpf_lwt_push_ip_encap()) or only reach the
helper when the mac header was already unset (bpf_update_srh_state()),
and do not read mac_len afterwards.

The issue was reported on the list by Piyus Kedia and Kapil Vaswani,
who found it by fuzzing with AI assistance and reproduced the KASAN
splat on v7.4-rc3. Their reproducer was not published, so this patch
is build tested only.

Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Reported-by: Kapil Vaswani <kapil@presceralabs.ai>
Closes: https://lore.kernel.org/netdev/20261116174531.2540348-2-piyus@iiitd=
.ac.in/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e43fe87fa5f9007b6d99f7aea0b44..9cd8eff0309cc3a646dc49e83a0=
cea79512cf8f5
100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3186,6 +3186,7 @@ static inline u32 skb_mac_header_len(const
struct sk_buff *skb)
 static inline void skb_unset_mac_header(struct sk_buff *skb)
 {
        skb->mac_header =3D (typeof(skb->mac_header))~0U;
+       skb->mac_len =3D 0;
 }

 static inline void skb_reset_mac_header(struct sk_buff *skb)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c6258726efaba346297ccbec7eef4..8fe0938d6131031a33b535fdf60=
d9eec50041ea4
100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6984,7 +6984,6 @@ static void skb_carve_reset_headers(struct sk_buff *s=
kb)
        skb_unset_mac_header(skb);
        skb_unset_transport_header(skb);
        skb_reset_network_header(skb);
-       skb->mac_len =3D 0;

        /* Inner offsets have no "unset" marker, zero them so that
         * skb_inner_network_header_was_set() becomes false and no
