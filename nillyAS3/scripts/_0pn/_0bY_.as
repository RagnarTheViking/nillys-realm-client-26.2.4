package _0pn
{
   import _1__8._127;
   import _v4.Client;
   import _m2._27;
   import _166.Package;
   import _0H_6.GameContext;
   import _3b.DialogSignal;
   import _05g.NotEnoughGoldDialog;
   import _1O_R_.NotEnoughFameDialog;
   import _1O_R_.ErrorDialog;
   
   public class _0bY_ implements _127
   {
       
      
      [Inject]
      public var client:Client;
      
      [Inject]
      public var _1sl:_27;
      
      [Inject]
      public var pkg:Package;
      
      public function _0bY_()
      {
         super();
      }
      
      public function approve() : Boolean
      {
         var _loc3_:* = undefined;
         var _loc1_:int = 0;
         switch(this.pkg.curType)
         {
            case 0:
               _loc1_ = this.client.getCredits();
               break;
            case 1:
               _loc1_ = this.client.getFame();
               break;
            case 3:
               _loc1_ = this.client.getTokens();
               break;
            default:
               return false;
         }
         var _loc2_:* = _loc1_ >= this.pkg.price;
         if(!_loc2_)
         {
            _loc3_ = GameContext.getInjector().getInstance(DialogSignal);
            switch(this.pkg.curType)
            {
               case 0:
                  _loc3_.dispatch(new NotEnoughGoldDialog());
                  break;
               case 1:
                  _loc3_.dispatch(new NotEnoughFameDialog());
                  break;
               default:
                  _loc3_.dispatch(new ErrorDialog("Not enough tokens"));
            }
         }
         return _loc2_;
      }
   }
}
