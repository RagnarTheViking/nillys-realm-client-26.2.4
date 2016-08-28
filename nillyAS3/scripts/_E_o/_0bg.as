package _E_o
{
   import _P_S_.Mediator;
   import _0Z_1.GuildRegisterPanel;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _S_b._O_e;
   import Frames.CreateGuildFrame;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.objects.Player;
   import _1O_R_.Dialog;
   import _C_._1O_I_;
   import flash.events.Event;
   
   public class _0bg extends Mediator
   {
       
      
      [Inject]
      public var view:GuildRegisterPanel;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _1tf:_O_e;
      
      public function _0bg()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._09X_.add(this._P_d);
         this.view.renounce.add(this._0N_H_);
      }
      
      override public function destroy() : void
      {
         this.view._09X_.remove(this._P_d);
         this.view.renounce.remove(this._0N_H_);
      }
      
      private function _P_d() : void
      {
         this._06Z_.dispatch(new CreateGuildFrame(this._1tf._14O_));
      }
      
      public function _0N_H_() : void
      {
         var _loc1_:GameSprite = this._1tf._14O_;
         if(_loc1_.map == null || _loc1_.map.player_ == null)
         {
            return;
         }
         var _loc2_:Player = _loc1_.map.player_;
         var _loc3_:Dialog = new Dialog(_1O_I_._qf,_1O_I_._0wh,_1O_I_._0W_d,_1O_I_._1ch,"/renounceGuild");
         _loc3_._1aO_(_1O_I_._0wh,{"guildName":_loc2_.guildName_});
         _loc3_.addEventListener(Dialog.LEFT_BUTTON,this._xK_);
         _loc3_.addEventListener(Dialog.RIGHT_BUTTON,this.onCancel);
         this._06Z_.dispatch(_loc3_);
      }
      
      private function onCancel(param1:Event) : void
      {
         this._0dR_.dispatch();
      }
      
      private function _xK_(param1:Event) : void
      {
         var _loc2_:GameSprite = this._1tf._14O_;
         if(_loc2_.map == null || _loc2_.map.player_ == null)
         {
            return;
         }
         var _loc3_:Player = _loc2_.map.player_;
         _loc2_.gsc_.guildRemove(_loc3_.name_);
         this._0dR_.dispatch();
      }
   }
}
