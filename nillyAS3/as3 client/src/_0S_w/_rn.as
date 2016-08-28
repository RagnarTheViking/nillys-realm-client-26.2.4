package _0S_w
{
   import flash.display.Sprite;
   import _v4.Client;
   import _0hJ_.Server;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.Event;
   import _1iT_._0K_U_;
   import _1iT_._1dA_;
   
   public class _rn extends Sprite
   {
       
      
      private var model:Client;
      
      private var server:Server;
      
      private var _1W_d:_0S_w._1u5;
      
      private var _p__:GameSprite;
      
      public function _rn()
      {
         super();
         this._1W_d = new _0S_w._1u5();
         this._1W_d.addEventListener(_1rW_._0V_Y_,this._super);
         addChild(this._1W_d);
      }
      
      public function initialize(param1:Client, param2:Server) : void
      {
         this.model = param1;
         this.server = param2;
      }
      
      private function _super(param1:_1rW_) : void
      {
         removeChild(this._1W_d);
         this._p__ = new GameSprite(this.server,Parameters._pf,false,this.model.getSavedCharacters()[0].charId(),-1,null,this.model,param1._01H_,false);
         this._p__.isEditor = true;
         this._p__.addEventListener(Event.COMPLETE,this._0l2);
         this._p__.addEventListener(_0K_U_.RECONNECT,this._0l2);
         this._p__.addEventListener(_1dA_.DEATH,this._0l2);
         addChild(this._p__);
      }
      
      private function _0l2(param1:Event) : void
      {
         this._1ge();
         addChild(this._1W_d);
      }
      
      private function _1o4(param1:Event) : void
      {
         this._1ge();
         addChild(this._1W_d);
      }
      
      private function _1ge() : void
      {
         this._p__.removeEventListener(Event.COMPLETE,this._0l2);
         this._p__.removeEventListener(_0K_U_.RECONNECT,this._0l2);
         this._p__.removeEventListener(_1dA_.DEATH,this._0l2);
         removeChild(this._p__);
         this._p__ = null;
      }
   }
}
