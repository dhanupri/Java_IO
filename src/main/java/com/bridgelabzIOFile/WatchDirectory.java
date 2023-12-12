package com.bridgelabzIOFile;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.HashMap;
import java.util.Map;
import static java.nio.file.StandardWatchEventKinds.*;
public class WatchDirectory {
    public final WatchService watcher;
    public final Map<WatchKey,Path> dirWatchers;
    //create new Watch service and Directory
    WatchDirectory( Path dir) throws IOException {
        this.watcher = FileSystems.getDefault().newWatchService();
        this.dirWatchers = new HashMap<WatchKey,Path>();
        scanAndRegisterDirectories(dir);
    }
    //register the new directory with services
    public  void registerDirWatchers(Path dir) throws IOException {
        WatchKey key=dir.register(watcher,ENTRY_CREATE,ENTRY_DELETE,ENTRY_MODIFY);
        dirWatchers.put(key,dir);
    }
    //register given directory with sub directory
    public void scanAndRegisterDirectories(final Path start) throws IOException{
        Files.walkFileTree(start,new SimpleFileVisitor<Path>(){
            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException{
                registerDirWatchers(dir);
                return FileVisitResult.CONTINUE;
            }

        });
    }
    //process all the event
    @SuppressWarnings({"rawtypes","unchecked"})
    public void processEvents(){
        while (true){
            WatchKey key;
            try {
                key=watcher.take();
            }
            catch (InterruptedException x){
                return;
            }
            Path dir=dirWatchers.get(key);
            if(dir==null){
                continue;
            }
            for (WatchEvent<?> event:key.pollEvents()){
                WatchEvent.Kind kind=event.kind();
                Path name=((WatchEvent<Path>)event).context();
                Path child=dir.resolve(name);
                System.out.println(event.kind()+" "+child);//print out the event
                //if dir created then register it and it's sub directory
                if(kind==ENTRY_CREATE){
                    try {
                        if(Files.isDirectory(child)) scanAndRegisterDirectories(child);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                } else if (kind.equals(ENTRY_DELETE)) {
                    if (Files.isDirectory(child)) dirWatchers.remove(key);
                }
            }
            //reset key if dir is removed
            boolean valid=key.reset();
            if(!valid){
                dirWatchers.remove(key);
                if (dirWatchers.isEmpty()){
                    break;
                }
            }
        }
    }
}
