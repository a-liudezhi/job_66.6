// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require_tree .

// 设定首页滚动按钮的触发行为

$(window).scroll(function () {  // 指的是当屏幕滚动时，所触发的功能
  if ($(this).scrollTop() > 200) { // 指的是当屏幕滚动到2500px的高度时，所触发的行为（因为我只设定在首页触发按钮，并且希望使用者将内容看完时才触发行为，所以数值较大）
    $(".goTop").fadeIn(100); // 指的是按钮淡入显示的时间，100为0.1秒
  } else {
    $(".goTop").fadeOut(200); // 指的是按钮淡出显示的时间，200为0.2秒
  }

    $(".goTop").click(  // 指的是当点击按钮时，所触发的动作
    function() {
      $('html,body').scrollTop(0);  // $('html,body').animate({scrollTop: 0}, 700),指的是将屏幕上移至高度为0的地方，700为上移速度
    });
})
//因此这段Javascript的意思就是，当屏幕向下滚动至200px的高度时，将以0.1秒的速度淡入显示按钮；点击按钮后，将缓慢地将屏幕上移至高度为0的地方，并同时将按钮以0.2秒的速度淡出显示
// 设定首页滚动按钮的触发行为 end--

// 设定navbar的滚动触发行为
$(window).scroll(function () {  // 指的是当屏幕滚动时，所触发的功能
    if ($(this).scrollTop() > 125) {  //指的是当屏幕滚动到125px的高度时，所触发的行为
        $('#navbar').addClass('show_bgcolor') //指的是抓取ID为navbar的物件，并加入名为show_bgcolor的CSS属性（也就是Part1为什么要在HTML里面设定ID的原因，这样Javascript才能抓取到对应的物件）
    } else {
        $('#navbar').removeClass('show_bgcolor')
    }
})

// 因此这段Javascript的意思就是，当屏幕向下滚动至125px的高度时，navbar加入show_bgcolor这个CSS属性，将背景色设定为深蓝色；向上滚动到125px高度之上时，移除show_bgcolor这个CSS属性，将背景色改回半透明
// 设定navbar的滚动触发行为 end--
