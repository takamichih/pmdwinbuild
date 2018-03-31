for patch in *.patch; do
  echo "Applying ${patch}..."
  patch -p1 < "${patch}"
done
