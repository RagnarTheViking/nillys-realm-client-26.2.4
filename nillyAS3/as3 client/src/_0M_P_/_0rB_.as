package _0M_P_
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _1O_R_.Dialog;
   import _aW_.IWebRequest;
   import _0H_6.GameContext;
   import _4u.Account;
   import flash.events.Event;
   import com.company.util._l5;
   import flash.display.Graphics;
   
   public class _0rB_ extends Sprite
   {
       
      
      private var _0A_C_:Boolean;
      
      private var _1E_A_:Shape;
      
      private var _1M_W_:Dialog;
      
      private var text_:String;
      
      private var _0hH_:_0Z_l;
      
      private var _J_z:_1sS_;
      
      private var client:IWebRequest;
      
      public function _0rB_(param1:Boolean)
      {
         super();
         this._0A_C_ = param1;
         this._1E_A_ = new Shape();
         var _loc2_:Graphics = this._1E_A_.graphics;
         _loc2_.clear();
         _loc2_.beginFill(0,0.8);
         _loc2_.drawRect(0,0,800,600);
         _loc2_.endFill();
         addChild(this._1E_A_);
         this.load();
      }
      
      private function load() : void
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         this.client = GameContext.getInjector().getInstance(IWebRequest);
         this.client.complete.addOnce(this._1s__);
         this.client.sendRequest("/guild/getBoard",_loc1_.credentials());
         this._1M_W_ = new Dialog(null,"Loading...",null,null,null);
         addChild(this._1M_W_);
         this._1E_A_.visible = false;
      }
      
      private function _1s__(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1Z_f(param2);
         }
         else
         {
            this.reportError(param2);
         }
      }
      
      private function _1Z_f(param1:String) : void
      {
         this._1E_A_.visible = true;
         removeChild(this._1M_W_);
         this._1M_W_ = null;
         this.text_ = param1;
         this.show();
      }
      
      private function show() : void
      {
         this._0hH_ = new _0Z_l(this.text_,this._0A_C_);
         this._0hH_.addEventListener(Event.COMPLETE,this._0Q_H_);
         this._0hH_.addEventListener(Event.CHANGE,this._0u1);
         addChild(this._0hH_);
      }
      
      private function reportError(param1:String) : void
      {
      }
      
      private function _0Q_H_(param1:Event) : void
      {
         parent.removeChild(this);
      }
      
      private function _0u1(param1:Event) : void
      {
         removeChild(this._0hH_);
         this._0hH_ = null;
         this._J_z = new _1sS_(this.text_);
         this._J_z.addEventListener(Event.CANCEL,this._jL_);
         this._J_z.addEventListener(Event.COMPLETE,this._1mp);
         addChild(this._J_z);
      }
      
      private function _jL_(param1:Event) : void
      {
         removeChild(this._J_z);
         this._J_z = null;
         this.show();
      }
      
      private function _1mp(param1:Event) : void
      {
         var _loc2_:Account = GameContext.getInjector().getInstance(Account);
         var _loc3_:Object = {"board":this._J_z._1g8()};
         _l5._0an(_loc3_,_loc2_.credentials());
         this.client = GameContext.getInjector().getInstance(IWebRequest);
         this.client.complete.addOnce(this._1H_M_);
         this.client.sendRequest("/guild/setBoard",_loc3_);
         removeChild(this._J_z);
         this._J_z = null;
         this._1M_W_ = new Dialog(null,"Saving...",null,null,null);
         addChild(this._1M_W_);
         this._1E_A_.visible = false;
      }
      
      private function _1H_M_(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1mu(param2);
         }
         else
         {
            this._0qd(param2);
         }
      }
      
      private function _1mu(param1:String) : void
      {
         this._1E_A_.visible = true;
         removeChild(this._1M_W_);
         this._1M_W_ = null;
         this.text_ = param1;
         this.show();
      }
      
      private function _0qd(param1:String) : void
      {
      }
   }
}
