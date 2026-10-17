'use strict';
document.addEventListener('DOMContentLoaded', () => {
  const toast = document.getElementById('toast');
  let toastTimer;
  function showToast(message) {
    toast.textContent = message;
    toast.classList.add('show');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => toast.classList.remove('show'), 2600);
  }
  async function copyText(value) {
    try {
      if (!navigator.clipboard || !navigator.clipboard.writeText) throw new Error('Clipboard unavailable');
      await navigator.clipboard.writeText(value);
      showToast('המספר הועתק ללוח!');
    } catch {
      showToast('לא ניתן להעתיק אוטומטית. המספר: 054-448-9324');
    }
  }
  document.getElementById('copy-phone').addEventListener('click', () => copyText('0544489324'));
  document.getElementById('share-page').addEventListener('click', async () => {
    const data = {title: 'פוקוס פוקוס - קסם של דרך', text: 'פוקוס פוקוס - קסם של דרך. צור איתי קשר בוואטסאפ, אינסטגרם או פייסבוק!', url: window.location.href};
    try {
      if (navigator.share) {
        await navigator.share(data);
      } else if (navigator.clipboard && navigator.clipboard.writeText) {
        await navigator.clipboard.writeText(window.location.href);
        showToast('קישור לעמוד הועתק ללוח!');
      } else {
        showToast('אפשר להעתיק את הקישור משורת הכתובת');
      }
    } catch (error) {
      if (error && error.name !== 'AbortError') showToast('לא ניתן לשתף כרגע');
    }
  });
});