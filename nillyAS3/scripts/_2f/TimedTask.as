package _2f
{
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class TimedTask
   {
      
      private static var NextId:uint;
      
      private static var Tasks:Dictionary = new Dictionary();
       
      
      public var id:uint;
      
      public var paused:Boolean;
      
      public var timeout:uint;
      
      public var lastRunTime:int;
      
      public function TimedTask(param1:uint)
      {
         super();
         this.timeout = param1;
      }
      
      public static function addTask(param1:TimedTask) : uint
      {
         if(Tasks[param1.id] == param1)
         {
            return param1.id;
         }
         var _loc2_:* = ++NextId;
         Tasks[_loc2_] = param1;
         param1.lastRunTime = getTimer();
         return NextId;
      }
      
      public static function runTasks(param1:int) : void
      {
         var _loc2_:TimedTask = null;
         var _loc3_:int = 0;
         for each(_loc2_ in Tasks)
         {
            if(!_loc2_.paused)
            {
               _loc3_ = param1 - _loc2_.lastRunTime;
               if(_loc3_ >= _loc2_.timeout)
               {
                  _loc2_.lastRunTime = param1;
                  _loc2_.run();
               }
            }
         }
      }
      
      public static function destroyTask(param1:TimedTask) : void
      {
         delete Tasks[param1.id];
         param1.onDestroyed();
      }
      
      public static function destroyAll() : void
      {
         var _loc1_:TimedTask = null;
         for each(_loc1_ in Tasks)
         {
            _loc1_.destroy();
         }
         Tasks = new Dictionary();
      }
      
      public final function add() : void
      {
         addTask(this);
      }
      
      public final function destroy() : void
      {
         destroyTask(this);
      }
      
      protected function run() : void
      {
      }
      
      protected function onDestroyed() : void
      {
      }
   }
}
