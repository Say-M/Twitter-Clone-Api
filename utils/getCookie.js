const getCookie = (cname, cookie) => {
  let name = cname + '=';
  let decodedCookie = decodeURIComponent(cookie);
  let ca = decodedCookie.split(';');
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) === ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) === 0) {
      return c.substring(name.length + 2, c.length);
    }
  }
  return '';
};

module.exports = getCookie;
