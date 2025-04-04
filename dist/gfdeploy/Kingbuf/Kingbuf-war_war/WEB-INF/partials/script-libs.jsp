<script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/validator/13.9.0/validator.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="public/utils/configs.js" defer></script>
<script src="public/utils/helpers.js" defer></script>
<script src="public/utils/sharings.js" defer></script>
<script src="public/utils/services.js" defer></script>

<script>
    const btnlogout = document.getElementById('logout-btn')
    if (btnlogout) {
        btnlogout.addEventListener('click', async function (event) {
            event.preventDefault(); // Ngăn chuyển trang

            try {
                const response = await fetch('/api/admin/logout', { method: 'GET' });

                if (response.ok) {
                    toaster.success("Đăng xuất thành công.", "", () => {
                        window.location.href = '/'
                    })
                } else {
                    toaster.error("Đăng xuất thất bại.")
                }
            } catch (error) {
                toaster.error("Đăng xuất thất bại.")
            }
        });
    }
</script>