var spawn = require('child_process').exec;

// Hexo 3 用户复制这段
hexo.on('new', function(data){
  spawn('start "C:\Users\何雄\AppData\Local\atom\atom.exe" ' + data.path);
});