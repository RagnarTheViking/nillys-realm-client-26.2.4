package _tZ_
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _W_Q_.TextButton;
   import com.company.assembleegameclient.objects.Player;
   import _1iT_._0J_1;
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import com.company.rotmg.graphics.ScreenGraphic;
   import flash.text.TextFieldAutoSize;
   import _1gF_.SimpleText;
   
   public class _1k2 extends Sprite
   {
       
      
      private var gs_:GameSpriteBase;
      
      private var container:Sprite;
      
      private var _A_m:_tZ_.GuildPlayerList;
      
      private var _1oK_:TextButton;
      
      public function _1k2(param1:GameSpriteBase)
      {
         super();
         this.gs_ = param1;
         graphics.clear();
         graphics.beginFill(2829099,0.8);
         graphics.drawRect(0,0,800,600);
         graphics.endFill();
         addChild(this.container = new Sprite());
         this._0dq();
         addChild(new ScreenGraphic());
         this._1oK_ = new TextButton(_1O_I_._064,36,false);
         this._1oK_.setAutoSize(TextFieldAutoSize.CENTER);
         this._1oK_.setVerticalAlign(SimpleText.MIDDLE);
         this._1oK_.addEventListener(MouseEvent.CLICK,this._x6);
         addChild(this._1oK_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _0dq() : void
      {
         if(this._A_m && this._A_m.parent)
         {
            this.container.removeChild(this._A_m);
         }
         var _loc1_:Player = this.gs_.map.player_;
         this._A_m = new _tZ_.GuildPlayerList(75,0,_loc1_ == null?"":_loc1_.name_,_loc1_.guildRank_);
         this._A_m.addEventListener(_1V_7.SET_RANK,this._V_n);
         this._A_m.addEventListener(_1V_7.REMOVE_MEMBER,this._0gk);
         this.container.addChild(this._A_m);
      }
      
      private function _01R_() : void
      {
         this._A_m.removeEventListener(_1V_7.SET_RANK,this._V_n);
         this._A_m.removeEventListener(_1V_7.REMOVE_MEMBER,this._0gk);
         this.container.removeChild(this._A_m);
         this._A_m = null;
      }
      
      private function _V_n(param1:_1V_7) : void
      {
         this._01R_();
         this.gs_.addEventListener(_0J_1._sY_,this._0F_g);
         this.gs_.gsc_.changeGuildRank(param1.name_,param1._1xi);
      }
      
      private function _0F_g(param1:_0J_1) : void
      {
         this.gs_.removeEventListener(_0J_1._sY_,this._0F_g);
         if(!param1.success_)
         {
            this._0iV_(param1._B_z);
         }
         else
         {
            this._0dq();
         }
      }
      
      private function _0gk(param1:_1V_7) : void
      {
         this._01R_();
         this.gs_.addEventListener(_0J_1._sY_,this._1gU_);
         this.gs_.gsc_.guildRemove(param1.name_);
      }
      
      private function _1gU_(param1:_0J_1) : void
      {
         this.gs_.removeEventListener(_0J_1._sY_,this._1gU_);
         if(!param1.success_)
         {
            this._0iV_(param1._B_z);
         }
         else
         {
            this._0dq();
         }
      }
      
      private function _0iV_(param1:String) : void
      {
         var _loc2_:Dialog = new Dialog(_1O_I_._zl,param1,_1O_I_._0z5,null,"/guildError");
         _loc2_.addEventListener(Dialog.LEFT_BUTTON,this._1f2);
         stage.addChild(_loc2_);
      }
      
      private function _1f2(param1:Event) : void
      {
         var _loc2_:Dialog = param1.currentTarget as Dialog;
         stage.removeChild(_loc2_);
         this._0dq();
      }
      
      private function _x6(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage;
         this._1oK_.x = 800 / 2;
         this._1oK_.y = 550;
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_,false,1);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._C_6,false,1);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_,false);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._C_6,false);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _C_6(param1:KeyboardEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function close() : void
      {
         stage.focus = null;
         parent.removeChild(this);
      }
   }
}
