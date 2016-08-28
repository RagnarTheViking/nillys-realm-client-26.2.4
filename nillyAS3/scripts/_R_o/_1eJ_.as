package _R_o
{
   import _P_S_.Mediator;
   import _1cV_.Console;
   import _0sm._17m;
   
   public final class _1eJ_ extends Mediator
   {
      
      private static const _md:String = "[0xFF3333:error - \"${value}\" not found]";
      
      private static const _0zy:String = "[0xFFEE00:${value}]";
       
      
      [Inject]
      public var view:_R_o._0J_y;
      
      [Inject]
      public var console:Console;
      
      [Inject]
      public var log:_17m;
      
      public function _1eJ_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         _1hQ_(ConsoleEvent.INPUT,this._1yR_,ConsoleEvent);
         _1hQ_(ConsoleEvent.GET_PREVIOUS,this._0zC_,ConsoleEvent);
         _1hQ_(ConsoleEvent.GET_NEXT,this._1__y,ConsoleEvent);
      }
      
      override public function destroy() : void
      {
         _1y7(ConsoleEvent.INPUT,this._1yR_,ConsoleEvent);
         _1y7(ConsoleEvent.GET_PREVIOUS,this._0zC_,ConsoleEvent);
         _1y7(ConsoleEvent.GET_NEXT,this._1__y,ConsoleEvent);
      }
      
      private function _1yR_(param1:ConsoleEvent) : void
      {
         var _loc2_:String = param1.data;
         this._H_I_(_loc2_);
         this.console.execute(_loc2_);
      }
      
      private function _H_I_(param1:String) : void
      {
         if(this.console._0V_u(param1))
         {
            this._0qW_(param1);
         }
         else
         {
            this._pU_(param1);
         }
      }
      
      private function _0qW_(param1:String) : void
      {
         var _loc2_:Array = param1.split(" ");
         _loc2_[0] = _0zy.replace("${value}",_loc2_[0]);
         this.log.dispatch(_loc2_.join(" "));
      }
      
      private function _pU_(param1:String) : void
      {
         var _loc2_:String = _md.replace("${value}",param1);
         this.log.dispatch(_loc2_);
      }
      
      private function _0zC_(param1:ConsoleEvent) : void
      {
         this.view.text = this.console._3C_();
      }
      
      private function _1__y(param1:ConsoleEvent) : void
      {
         this.view.text = this.console._1J_u();
      }
   }
}
