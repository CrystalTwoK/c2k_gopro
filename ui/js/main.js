var tag = document.createElement('script');
tag.src = 'https://www.youtube.com/iframe_api';
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
var player;
var videoid = '';
var Writer = {}
var itemData = '';

window.addEventListener('message', e => {
  let data = e.data;

  if (data.action == "show") { 
      document.body.classList.remove('hidden');
      if (data.type == 'gopro'){
        if (data.gopro){
          $('#ui').removeClass('hidden');
          $('#text').text(`HEXA BODY 3 X-${data.citizenid}`);
        } else {
          hide();
        }
      }
  }
  else if (data.action == 'hide') { 
      hide();
  }

})

function hide(){
  document.body.classList.add('hidden');
  $('#videoplayer').addClass('hidden');
  $('#ui').addClass('hidden');
  $('#uploadlink').addClass('hidden');
  videoid = '';
}

setInterval(() => {
    const now = new Date();
    let offset = now.getTimezoneOffset() / -120;
    now.setTime(now.getTime() + offset * 60);
    if (
      now.getTimezoneOffset() <
      Math.max(
        new Date(now.getFullYear(), 0, 1).getTimezoneOffset(),
        new Date(now.getFullYear(), 6, 1).getTimezoneOffset(),
      )
    ) {
      offset += 1;
    }
    const iso = new Date(now.getTime() + offset * 36e5).toISOString();
    $('#date').text(
      `${iso.substring(0, 10)} ${iso.substring(11, 19)} ${offset < 0 ? '-' : '+'}${Math.abs(offset)
        .toString()
        .padEnd(3, '0')
        .padStart(4, '0')}`,
    );
  }, 1e3);