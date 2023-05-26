#!/bin/env bash
php /var/www/sculpin/vendor/bin/sculpin generate --clean --watch --source-dir ../source --output-dir /var/www/public & apache2-foreground