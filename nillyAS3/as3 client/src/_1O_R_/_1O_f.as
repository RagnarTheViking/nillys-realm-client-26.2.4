package _1O_R_
{
   import _f7.Signal;
   import flash.events.Event;
   
   public class _1O_f
   {
       
      
      private const _10S_:Signal = new Signal();
      
      private var _3B_:_1O_R_._1uu;
      
      private var _0Q_r:Vector.<String>;
      
      public function _1O_f()
      {
         this._0Q_r = new Vector.<String>();
         super();
      }
      
      public function add(param1:_1O_R_._1uu, param2:String) : void
      {
         this._3B_ = param1;
         this._0Q_r.push(param2);
         param1.addEventListener(param2,this._161);
      }
      
      private function _161(param1:Event) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in this._0Q_r)
         {
            this._3B_.removeEventListener(_loc2_,this._161);
         }
         this._3B_._1tG_().dispatch();
      }
      
      public function _1tG_() : Signal
      {
         return this._10S_;
      }
   }
}
