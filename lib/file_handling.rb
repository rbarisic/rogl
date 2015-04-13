# File Handling
class Engine
    class Filehandling
        def file_job(path, &block)
            file = File.new(path,"w+")
            yield
            file.close
        end

        def close_file(file)
            file.close
        end
    end
end