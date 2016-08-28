package _0H_w
{
   import com.google.analytics.GATracker;
   import flash.display.Stage;
   import com.company.googleanalytics.GA;
   
   public class _6
   {
       
      
      private var tracker:GATracker;
      
      public function _6()
      {
         super();
      }
      
      public function init(param1:Stage, param2:String) : void
      {
         this.tracker = new GATracker(param1,param2);
         GA.setTracker(this.tracker);
      }
      
      public function trackEvent(param1:String, param2:String, param3:String, param4:Number) : Boolean
      {
         return this.tracker.trackEvent(param1,param2,param3,param4);
      }
      
      public function _0P_r(param1:String) : void
      {
         this.tracker.trackPageview(param1);
      }
   }
}
