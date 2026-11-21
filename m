Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245018;
	b=cEGCOygJHOjoephrKSrhp8O8H7e83d9/Zj9BlU3vwzRhEDfoHXP58v0bnEBLwlS7HYGa
	 r7E1OTl5pw4g0SSNAy5jFqgOfrGwYKnaX7oS7PETkRgJQWclvjIL063r8g39g9XZPWc7N
	 6NqRVUR8dkgKMVs2x5mv4qnvfcavu1FS8MzPUthSaVhLRi4+uN8cjHpT5r3NfThWyDlJB
	 eD/wpibqhXwcUegS0/lehznaQfRj6RAyVajumNPr5qWAK6lRcvr+gWgWDWFHyMKheySs+
	 pzZQ8CAPthol/2UF6nm/PzYOuNXXYtkFgWIOQ8X/t9spyuSdq60C4WGv4DSMnLw4MDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245018;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HCR6TNS3FYUFK2NIh07FU+Ei8iFBnSpvWu99uTLh1as=;
	b=JPMp7YNzqHJxTTlFcLdY+SnFznX1x1lLz74sFVN9qyGMzMLC5aukixL+kxdD6ArYsrO1
	 Fi7crEUjrebGPyd1NsPEWdepPcTkGXLVyp+paa0stRHrfDiPWEnAK9mWnhYM5rAJsp4Lk
	 J9LaZtuihwmp/Z6ljas6PvXcBIGvvIT/Z/Bu6EKR86EWZjew6FL776XSO1DjGoroTiNBC
	 Gdv4F3HZvZrA4K7Pupq9aqd0XdgiRQZaoQzcelzVcbOdhfXcxTYhAe0f7cX6wd+klQ5AH
	 Ber3AfdPo3fPamf4ZvbNbbRZEnr7ohOsMSlIcX7Jz1nvDQpaBszcgAm/DaWD5iROvFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxaAPlnj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F31606A320;
	Sat, 21 Nov 2026 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxaAPlnj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDA91F000C6;
	Sat, 21 Nov 2026 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795245017;
	bh=HCR6TNS3FYUFK2NIh07FU+Ei8iFBnSpvWu99uTLh1as=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QxaAPlnju8Ge/8T4EQXuhfPC/LwN8XXNFGCx3Eo5JaToHLFluqmHz4LBoRQJI1oeA
	 9mgAkOCUXlEI6G31P7O+tM2+faWB9f9N73+LxIFPDbr4fkn3003kA38JXYvUFSofcz
	 e6xqWrzs4BUQdOYxpFZM5lANvn11OTPTjoFGqJYLeDK/9XU+ukfVJ0xatKVBwb/jHH
	 YHXkE+0e5+QZDe5NfDwvZxGzhpSHHVIE3N+F5MABYiDnCD3zKQ4JGpA5ZSgtDI8KPl
	 Id2w/iZOBqxJmKmPuPGwSEy1bzycLCNTiX2EvEud6MtgMnafwlFRErXjdsv0Y49us6
	 3n7uzwcMafqFQ==
Subject: Re: [PATCH net v2] xfrm: do not write the ethernet header when the
 mac header is unset
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, andrea.mayer@uniroma2.it, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, kapil@presceralabs.ai
Date: Sat, 21 Nov 2026 07:10:16 +0000
Message-ID: <179524501671.3135.15869590714107061136@kernel.org>
In-Reply-To: <20261117062046.3286096-1-piyus@iiitd.ac.in>
References: <20261117062046.3286096-1-piyus@iiitd.ac.in>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix stops the h_proto store, but the skb still leaves decap
  with an unset mac header.
- [Medium] The changelog correctly finds where the malformed skb comes
  from but does not fix it there.
- [Medium] In __input_process_payload() (net/xfrm/xfrm_iptfs.c) the
  commit message cites the old_mac branch as precedent ('what…
- [Low] The patch fixes an out-of-bounds write but has no Fixes: tag and
  no Cc: stable.
- [Low] The Signed-off-by chain is malformed.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is the same
  out-of-bounds-write-via-mac_header pattern, in the function the patch…

--

xfrm: do not write the ethernet header when the mac header is unset

This patch adds a skb_mac_header_was_set() check before the eth_hdr()
h_proto store at three sites: xfrm4_remove_tunnel_encap(),
xfrm6_remove_tunnel_encap(), and the IPTFS skb reuse path in
__input_process_payload(). The skb state it guards against comes from
end_dt_vrf_rcv(), which calls skb_unset_mac_header() and leaves mac_len
at the Ethernet value.

Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in

> Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>

[Severity: Low]
The author is Piyus Kedia, but Kapil Vaswani's Signed-off-by comes first
and there is no Co-developed-by: tag.

Should there be a Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
line right before his Signed-off-by, as described in
Documentation/process/submitting-patches.rst? If he did not co-write the
patch, should the trailers be reordered?

[Severity: Low]
This fixes an out-of-bounds write, but it has no Fixes: tag and no Cc:
stable. The notes say the introducing commit could not be found. The
history is in tree, though:

  The producer, skb_unset_mac_header() in end_dt_vrf_rcv(), came in with
  664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior").

  The xfrm_iptfs.c site came in with 3f3339885fb3 ("xfrm: iptfs: add
  reusing received skb for the tunnel egress packet").

  The xfrm_input.c lines blame to b3284df1c86f ("xfrm: remove input2
  indirection from xfrm_mode"), which moved older code.

Should this carry separate Fixes: tags, or be split into two patches? The
IPTFS hunk will not apply to trees that predate IPTFS.

> diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> index 5ed87d51392a5..624ff8055e470 100644
> --- a/net/xfrm/xfrm_input.c
> +++ b/net/xfrm/xfrm_input.c
> @@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
>  
>  	skb_reset_network_header(skb);
>  	skb_mac_header_rebuild(skb);
> -	if (skb->mac_len)
> +	if (skb_mac_header_was_set(skb) && skb->mac_len)
>  		eth_hdr(skb)->h_proto = skb->protocol;
>  
>  	err = 0;

[Severity: High]
The store is now skipped, but xfrm4_remove_tunnel_encap() still returns 0
with mac_header == 0xffff and mac_len still non-zero. Can the same skb
still be read through the unset header later on, in GRO?

In the tunnel decaps branch, xfrm_input() passes the skb to GRO:

    gro_cells_receive(&gro_cells, skb);

skb->dev is the VRF device. It has NETIF_F_GRO, and ether_setup() gives it
hard_header_len == ETH_HLEN, so GRO is not skipped:

gro_cell_poll()
  napi_gro_receive()
    gro_receive_skb()
      dev_gro_receive()
        gro_list_prepare()

For each held packet p with a matching hash, gro_list_prepare() does:

    if (maclen == ETH_HLEN)
        diffs |= compare_ether_header(skb_mac_header(p),
                                      skb_mac_header(skb));

skb_mac_header() only issues a DEBUG_NET_WARN and returns
skb->head + 0xffff. That makes this a 14-byte read, for both skbs, at the
same fixed address 64KB past head that the commit message describes.

The held packet p is also still unset. At found_ptype, dev_gro_receive()
only calls skb_reset_mac_len(), which leaves mac_header at 0xffff. Two
packets of one inner flow in the same NAPI poll, such as two consecutive
TCP segments, look like enough to trigger this.

The skb_reset_mac_len() warning used as the control in the test notes
looks like this same skb reaching found_ptype in dev_gro_receive(), or
__netif_receive_skb_core(), on the patched kernel.

Would it work better to normalise the skb, either in end_dt_vrf_rcv() or
here by resetting the mac header and setting mac_len = 0 when it was
unset? That would remove both the write and this read.

> @@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
>  
>  	skb_reset_network_header(skb);
>  	skb_mac_header_rebuild(skb);
> -	if (skb->mac_len)
> +	if (skb_mac_header_was_set(skb) && skb->mac_len)
>  		eth_hdr(skb)->h_proto = skb->protocol;
>  
>  	err = 0;

[Severity: Medium]
The commit message identifies where the bad state comes from, but the fix
is applied at three consumers instead. Is there a reason to leave
end_dt_vrf_rcv() and skb_unset_mac_header() unchanged?

net/ipv6/seg6_local.c:end_dt_vrf_rcv() {
    ...
	skb_unset_mac_header(skb);

	skb = dev->l3mdev_ops->l3mdev_l3_rcv(dev, skb, family);
    ...
}

skb_unset_mac_header() writes the ~0 sentinel and leaves mac_len alone.
That breaks the rule skb_reset_mac_len() enforces:

	if (!skb_mac_header_was_set(skb)) {
		DEBUG_NET_WARN_ON_ONCE(1);
		skb->mac_len = 0;

vrf_ip_rcv() and vrf_ip6_rcv() only rebuild the header when
!list_empty(&vrf_dev->ptype_all). Without a sniffer attached, the skb goes
through the IP stack and xfrm with mac_header unset and
mac_len == ETH_HLEN.

After this patch, the skb still leaves tunnel decap in that state through
gro_cells_receive(). Any later consumer that trusts mac_len or
skb_mac_header() is still exposed, and the GRO read above is one of them.

There are two ways to fix this at the source. One is to give the skb a
valid mac header with mac_len = 0 after l3mdev_l3_rcv() when VRF did not
rebuild it. The other is to have skb_unset_mac_header() clear mac_len.
Would either one make the original "if (skb->mac_len)" checks correct
again?

> diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> index 0313a43aa8a97..41af72a9206ad 100644
> --- a/net/xfrm/xfrm_iptfs.c
> +++ b/net/xfrm/xfrm_iptfs.c
> @@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
>  
>  				skb->protocol = protocol;
>  				skb_mac_header_rebuild(skb);
> -				if (skb->mac_len)
> +				if (skb_mac_header_was_set(skb) && skb->mac_len)
>  					eth_hdr(skb)->h_proto = skb->protocol;
>  
>  				/* all pointers could be changed now reset walk */

[Severity: Medium]
The commit message says:

    This mirrors what xfrm4_transport_input() already does, ... and what
    __input_process_payload() already does for old_mac

Does the old_mac branch really check as much as this one? old_mac depends
only on skb_mac_header_was_set():

	old_mac = skb_mac_header_was_set(skb) ? skb_mac_header(skb) : NULL;

The alloc path then writes h_proto without looking at mac_len:

			skb->protocol = protocol;
			if (old_mac) {
				/* rebuild the mac header */
				skb_set_mac_header(skb, -first_skb->mac_len);
				memcpy(skb_mac_header(skb), old_mac, first_skb->mac_len);
				eth_hdr(skb)->h_proto = skb->protocol;
			}

When first_skb->mac_len is 0, the mac header lands at skb->data, which is
the start of the inner IP header that was just copied in. The h_proto
store then writes 0x0800 or 0x86dd at data + 12.

For IPv4 that overwrites the first two bytes of saddr. For IPv6 it
overwrites bytes 4-5 of saddr, after ESP authentication has already been
done.

A set mac header with mac_len == 0 is normal on L3 receive devices such as
tun with IFF_TUN, ipgre without header_ops, and ip6_tunnel. Every inner
packet after the first in an aggregated IPTFS payload takes this alloc
path.

Should both branches check old_mac && first_skb->mac_len, or, better,
require a real Ethernet header?

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. The same
alloc path in __input_process_payload() has a related out-of-bounds write
through mac_header. Is the headroom checked before these lines?

	skb_set_mac_header(skb, -first_skb->mac_len);
	memcpy(skb_mac_header(skb), old_mac, first_skb->mac_len);

The new skb is allocated by iptfs_alloc_skb(..., false), called from
iptfs_pskb_extract_seq() or iptfs_pskb_add_frags(). That only reserves:

#define XFRM_IPTFS_MIN_L2HEADROOM (L1_CACHE_BYTES > 64 ? 64 : 64 + 16)

If first_skb->mac_len is larger than that headroom, the u16 mac_header
wraps to roughly 0xfff4-0xffff. memcpy() then writes mac_len bytes about
64KB past skb->head, and the h_proto store after it is out of bounds too.

ipgre with ipgre_header_ops can get there, in ipgre_rcv():

	if (tunnel->dev->header_ops == &ipgre_header_ops)
		skb_pop_mac_header(skb);

That sets mac_len to the outer IP header plus the GRE header, up to 76
bytes. This is more than the 64 bytes reserved on arches with
L1_CACHE_BYTES > 64, and the copied bytes come from outer headers that ESP
does not authenticate.

A tc ingress BPF program using bpf_skb_change_head() can also make mac_len
larger than the headroom on any arch, though that needs privileges.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117062046.3286096-1-piyus%40iiitd.ac.in
