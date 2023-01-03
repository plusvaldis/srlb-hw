resource mysql {
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
        device /dev/drbd3;
        disk /dev/vg0/mysql;
        address 192.168.56.102:7794;
        meta-disk internal;
    }
    on nodeOne
    {
        device /dev/drbd3;
        disk /dev/vg0/mysql;
        address 192.168.56.101:7794;
        meta-disk internal;
    }
}
