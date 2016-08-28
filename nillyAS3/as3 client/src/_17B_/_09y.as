package _17B_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _1F_z._07p;
   import _1F_z._O_Z_;
   
   public class _09y extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_.FusionStrength;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _12P_:_07p;
      
      public function _09y()
      {
         super();
      }
      
      override public function initialize() : void
      {
         if(!this._12P_._05k)
         {
            this._12P_._05k = this._0xI_._0T_T_();
         }
         if(this._12P_._wo())
         {
            this.view._S_f(_O_Z_._1yy(this._12P_._05k,this._12P_._0Y_p));
         }
         else
         {
            this.view.reset();
         }
      }
   }
}
