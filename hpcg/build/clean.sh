#!/bin/bash
case "$(pwd)" in
    /|/bin|/boot|/dev|/etc|/lib*|/proc|/root|/sbin|/sys|/usr|/var)
        exit 1
        ;;
esac

rm -rf bin
rm -rf hpcg-*
