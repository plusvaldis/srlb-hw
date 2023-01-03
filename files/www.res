resource www {
    protocol C;

    disk {
        fencing resource-only;
    }

    handlers {
        fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
        after-resync-target "/usr/lib/drbd/crm-unfence-peer.sh";
    }
syncer {
        rate 110M;
    }
    on nodeTwo
    {
        device /dev/drbd2;
        disk /dev/vg0/www;
        address 192.168.1.2:7794;
        meta-disk internal;
    }
    on nodeOne
    {
        device /dev/drbd2;
        disk /dev/vg0/www;
        address 192.168.1.1:7794;
        meta-disk internal;
    }
}
