function varargout = gradient(varargin)
if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesTree') && isa(varargin{2},'gtsam.VectorValues')
    varargout{1} = gtsam_wrapper(2131, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.gradient');
end
