require 'open3'

class Coer

  COUNT = 4

  def initialize
    @q = Queue.new
    @ts = Array.new(COUNT).map do
      Thread.new do
        loop do
          repo = @q.pop
          break if repo == :die
          co repo
        end
      end
    end
  end

  def enq a
    a.each {|x| @q.push x }
  end

  def die
    @ts.length.times { @q.push :die }
    loop do
      Thread.pass
      break if @ts.all? {|t| !t.alive?}
    end
  end

  private

  def path_for repo
    u, r = repo.split('/')
    File.join CWD, u, 'start', r
  end

  def co repo
    d = path_for repo
    if File.exist? d and File.directory? d
      puts 'updating %s...' % repo
      exec 'git pull', chdir: d
    else
      puts 'cloning %s...' % repo
      exec "git clone https://github.com/#{repo} #{d}", chdir: CWD
    end
    helptags d
    true
  end

  def helptags dir
    d = File.join dir, 'doc'
    if File.exist? d and File.directory? d
      puts 'running helptags %s...' % dir
      exec "vim -u NONE -c 'helptags #{d}' -c q", chdir: CWD
    end
  end

  def exec cmd, chdir: 
    out, err, status = Open3.capture3(cmd, chdir: chdir)
    unless status.success?
      puts "cmd: '#{cmd}' unsuccessful."
      puts "stdout:\n" + out.strip
      puts "stderr: \n" + err.strip
    end
  end

end
